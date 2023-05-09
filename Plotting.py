import os
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
from matplotlib.ticker import ScalarFormatter

# Set the directory where the plotfiles are located
file_dir = "./Output"

# Initialize empty lists to store the t and dt values, N values
t_values = []
dt_values = []
N_values = []

# Loop over each plotfile
for i in range(99):
    # Construct the filename
    filename = os.path.join(file_dir, f"PlotFile_{i}")

    # Open the file and extract the dt, t, and N values
    with open(filename, "r") as f:
        N = []
        for line in f:
            if line.startswith("t:"):
                t = float(line.split(": ")[1])
            elif line.startswith("dt:"):
                dt = float(line.split(": ")[1])
            elif line.startswith("N:"):
                N_line = line.split(": ")[1].strip()
                N.append(np.array([float(x) for x in N_line.split()]))

    # Append the t, dt, and N values to the lists
    t_values.append(t)
    dt_values.append(dt)
    N_values.append(N)

# Convert the lists to NumPy arrays
t_array = np.array(t_values)
dt_array = np.array(dt_values)
N_array = np.array(N_values)

# Apply log10 to the relevant arrays
t_log_array = np.log10(t_array)
dt_log_array = np.log10(dt_array)
N_log_array = np.log10(N_array)

# Set up the subplots sharing the same x-axis
sns.set_style("white")
fig, (ax1, ax2) = plt.subplots(nrows=2, ncols=1, figsize=(8, 12), sharex=True)

# Plot dt vs t on the first subplot
ax1.plot(t_log_array[1:], dt_log_array[1:], c="red", alpha=0.9, linewidth=1.5, zorder=2)
ax1.set_ylabel("Timestep (log10(s))", fontsize=16, labelpad=20)
ax1.tick_params(axis='both', which='major', labelsize=14)

# Plot N vs t on the second subplot
palette = sns.color_palette("hls", n_colors=N_log_array.shape[2])
colors = list(palette.as_hex())
for i in range(N_log_array.shape[2]):
    ax2.plot(t_log_array[1:], N_log_array[1:, :, i], c=colors[i], alpha=0.98, linewidth=0.5, zorder=2)
    

ax2.set_xlabel("Time (log10(s))", fontsize=16, labelpad=10)
ax2.set_ylabel("Population (log10(N))", fontsize=16, labelpad=20)
ax2.tick_params(axis='both', which='major', labelsize=14)

# Add titles
ax1.set_title("Timestep vs Time; EA; TolC = 1.0e-05; dtgrow = 1.03", fontsize=18, y=1.05)
ax2.set_title("Population vs Time; EA; TolC = 1.0e-05; dtgrow = 1.03", fontsize=18, y=1.05)

# Adjust the space between the subplots
fig.subplots_adjust(hspace=0.3)

# Save the plot to a file
#plt.savefig("combined_plot_separate_subplots_Model_5.eps", dpi=300, bbox_inches="tight")

plt.show()
