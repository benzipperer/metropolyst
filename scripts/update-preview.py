#!/usr/bin/env python3
"""Generate preview.png from example-default.pdf as a 3x2 grid of slides."""

import subprocess
import tempfile
from pathlib import Path
from PIL import Image

SCRIPT_DIR = Path(__file__).parent
PROJECT_ROOT = SCRIPT_DIR.parent
PDF_PATH = PROJECT_ROOT / "examples" / "example-default.pdf"
OUTPUT_PATH = PROJECT_ROOT / "assets" / "preview.png"

COLS = 3
ROWS = 2
DPI = 150
BORDER = 4
BORDER_COLOR = (200, 200, 200)


def main():
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Convert PDF pages to PNG using pdftoppm
        subprocess.run(
            ["pdftoppm", "-png", "-r", str(DPI), str(PDF_PATH), str(tmpdir / "page")],
            check=True,
        )

        # Load page images
        page_files = sorted(tmpdir.glob("page-*.png"))
        if len(page_files) < COLS * ROWS:
            raise ValueError(f"Expected at least {COLS * ROWS} pages, got {len(page_files)}")

        images = [Image.open(f) for f in page_files[: COLS * ROWS]]

        # Get dimensions from first image
        img_width, img_height = images[0].size

        # Calculate grid dimensions with borders
        grid_width = COLS * img_width + (COLS + 1) * BORDER
        grid_height = ROWS * img_height + (ROWS + 1) * BORDER

        # Create grid image with border color background
        grid = Image.new("RGB", (grid_width, grid_height), BORDER_COLOR)

        # Place images in grid
        for idx, img in enumerate(images):
            row, col = divmod(idx, COLS)
            x = BORDER + col * (img_width + BORDER)
            y = BORDER + row * (img_height + BORDER)
            grid.paste(img, (x, y))

        # Save result
        grid.save(OUTPUT_PATH, "PNG", optimize=True)
        print(f"Created {OUTPUT_PATH}")


if __name__ == "__main__":
    main()
