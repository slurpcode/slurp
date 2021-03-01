"""Creates logos from the Matplotlib Colormaps."""
import glob
import os
import sys

import matplotlib.pyplot as plt  # pylint:disable=E0401

cmaps = [
    ("Perceptually Uniform Sequential", [
     "viridis", "plasma", "inferno", "magma"]),
    (
        "Sequential",
        [
            "Greys",
            "Purples",
            "Blues",
            "Greens",
            "Oranges",
            "Reds",
            "YlOrBr",
            "YlOrRd",
            "OrRd",
            "PuRd",
            "RdPu",
            "BuPu",
            "GnBu",
            "PuBu",
            "YlGnBu",
            "PuBuGn",
            "BuGn",
            "YlGn",
        ],
    ),
    (
        "Sequential (2)",
        [
            "binary",
            "gist_yarg",
            "gist_gray",
            "gray",
            "bone",
            "pink",
            "spring",
            "summer",
            "autumn",
            "winter",
            "cool",
            "Wistia",
            "hot",
            "afmhot",
            "gist_heat",
            "copper",
        ],
    ),
    (
        "Diverging",
        [
            "PiYG",
            "PRGn",
            "BrBG",
            "PuOr",
            "RdGy",
            "RdBu",
            "RdYlBu",
            "RdYlGn",
            "Spectral",
            "coolwarm",
            "bwr",
            "seismic",
        ],
    ),
    (
        "Qualitative",
        [
            "Pastel1",
            "Pastel2",
            "Paired",
            "Accent",
            "Dark2",
            "Set1",
            "Set2",
            "Set3",
            "tab10",
            "tab20",
            "tab20b",
            "tab20c",
        ],
    ),
    (
        "Miscellaneous",
        [
            "flag",
            "prism",
            "ocean",
            "gist_earth",
            "terrain",
            "gist_stern",
            "gnuplot",
            "gnuplot2",
            "CMRmap",
            "cubehelix",
            "brg",
            "hsv",
            "gist_rainbow",
            "rainbow",
            "jet",
            "nipy_spectral",
            "gist_ncar",
        ],
    ),
]


def create_images(logos_dir):
    """
    For each of our logos this function creates
    79 images from the Colormaps of Matplotlib.
    """
    cwd = os.getcwd()
    for f in glob.glob(os.path.join(logos_dir, "**.png")):
        d = os.path.splitext(os.path.basename(f))[0]
        if not os.path.exists(os.path.join(cwd, "images", "logos", d)):
            os.makedirs(os.path.join(cwd, "images", "logos", d))
        img = plt.imread(f)
        lum_img = img[:, :, 1]
        i = 0
        for cmap_category, cmap_list in cmaps:  # pylint: disable=W0612
            for color in cmap_list:
                i += 1
                plt.imsave(
                    os.path.join(cwd, "images/logos/%s/%s.png" % (d, i)),
                    lum_img,
                    cmap="%s" % color,
                )


create_images(sys.argv[1])
