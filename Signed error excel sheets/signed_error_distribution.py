import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# ==========================================================
#  Signed Error Distribution of Approximate 8x8 Multiplier
#  CSV columns: A, B, Exact, Approx, Abs_Error, Sq_Error, MRED_per, Incorrect
# ==========================================================

filename  = r"C:\Users\ankit\8x8 Multiplier\Signed error excel sheets\A6_c.csv"     # <-- change to the full path of your CSV
BIN_WIDTH = 5                 # histogram bin width (integer error units)
SHOW_INSET = False              # zoomed inset around 0 (bin width = 1)

# ---------------- Read CSV ----------------
df = pd.read_csv(filename, low_memory=False)

# The file has a "Metric,Value" block after the data rows -> keep only numeric rows
for c in ["A", "B", "Exact", "Approx", "Abs_Error"]:
    df[c] = pd.to_numeric(df[c], errors="coerce")
df = df.dropna(subset=["A", "B", "Exact", "Approx"])

Exact  = df["Exact"].to_numpy()
Approx = df["Approx"].to_numpy()

# ---------------- Signed error ----------------
SignedError = (Approx - Exact).astype(int)

# Sanity check against the Abs_Error column
if not np.array_equal(np.abs(SignedError), df["Abs_Error"].to_numpy().astype(int)):
    print("WARNING: Abs_Error column does not match |Approx-Exact| - check column order!")

# ---------------- Statistics ----------------
N = len(SignedError)
zero = np.sum(SignedError == 0)
pos  = np.sum(SignedError > 0)
neg  = np.sum(SignedError < 0)
print(f"\nTotal Samples     : {N}")
print(f"Zero Error Samples: {zero} ({100*zero/N:.2f} %)")
print(f"Positive Errors   : {pos} ({100*pos/N:.2f} %)")
print(f"Negative Errors   : {neg} ({100*neg/N:.2f} %)")
print(f"Error range       : [{SignedError.min()}, {SignedError.max()}]")

# ---------------- Plot style ----------------
plt.rcParams.update({
    "font.family": "serif",
    "font.serif": ["Times New Roman", "Liberation Serif", "DejaVu Serif"],
    "font.weight": "bold",
})
BLUE = (0.2, 0.45, 0.85, 0.6)      # similar to MATLAB's default FaceAlpha

def bold_ticks(ax, size):
    ax.tick_params(labelsize=size, width=1.2)
    for t in ax.get_xticklabels() + ax.get_yticklabels():
        t.set_fontweight("bold")

# ---------------- Histogram ----------------
# Bin edges are multiples of BIN_WIDTH, so one bin starts exactly at 0
lo = np.floor(SignedError.min() / BIN_WIDTH) * BIN_WIDTH
hi = (np.floor(SignedError.max() / BIN_WIDTH) + 1) * BIN_WIDTH
edges = np.arange(lo, hi + BIN_WIDTH, BIN_WIDTH)

fig, ax = plt.subplots(figsize=(8.5, 5.5), facecolor="w")
ax.hist(SignedError, bins=edges, weights=np.full(N, 1 / N),   # weights=1/N -> probability
        facecolor=BLUE, edgecolor="k", linewidth=0.6, zorder=3)
ax.axvline(0, color="k", linestyle="--", linewidth=2, zorder=4)

ax.set_xlabel("Signed Error (Approx-Exact)", fontsize=14, fontweight="bold")
ax.set_ylabel("Probability of Occurrence",   fontsize=14, fontweight="bold")
ax.grid(True, color="gray", alpha=0.35, linewidth=1.2, zorder=0)
for s in ax.spines.values():
    s.set_linewidth(1.3)
bold_ticks(ax, 13)

# ---------------- Optional zoomed inset ----------------
if SHOW_INSET:
    axin = ax.inset_axes([0.08, 0.38, 0.5, 0.55])
    axin.hist(SignedError, bins=np.arange(-40, 13) - 0.5, weights=np.full(N, 1 / N),
              facecolor=BLUE, edgecolor="k", linewidth=0.5, zorder=3)
    axin.axvline(0, color="k", linestyle="--", linewidth=1.5, zorder=4)
    axin.set_xlim(-40, 12)
    axin.grid(True, color="gray", alpha=0.35, linewidth=1, zorder=0)
    axin.set_title("Zoom: bin width = 1", fontsize=10, fontweight="bold")
    bold_ticks(axin, 10)

plt.tight_layout()

# ---------------- Save ----------------
plt.savefig("Signed_Error_Distribution.png", dpi=600)
plt.savefig("Signed_Error_Distribution.pdf")     # vector version
plt.show()
