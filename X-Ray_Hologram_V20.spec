# PyInstaller specification for X-Ray Hologram V20
# Windows x64 build is produced by the 64-bit GitHub Actions runner.
from PyInstaller.utils.hooks import collect_submodules

hiddenimports = [
    "tkinter",
    "tkinter.ttk",
    "tkinter.filedialog",
    "tkinter.messagebox",
    "PIL",
    "PIL.Image",
    "matplotlib",
    "matplotlib.backends.backend_tkagg",
    "matplotlib.widgets",
    "matplotlib.ticker",
    "scipy",
    "scipy.signal",
    "scipy.ndimage",
    "scipy.optimize",
    "scipy.interpolate",
    "skimage",
    "skimage.exposure",
    "skimage.filters",
    "skimage.measure",
    "skimage.morphology",
    "h5py",
    "pandas",
    "numpy",
    "imageio",
    "imageio.v2",
]

hiddenimports += collect_submodules("scipy")
hiddenimports += collect_submodules("skimage")

a = Analysis(
    ["X-Ray_Hologram_V20.py"],
    pathex=["."],
    binaries=[],
    datas=[],
    hiddenimports=hiddenimports,
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=[],
    noarchive=False,
)

pyz = PYZ(a.pure)

# Explicit one-file executable.
exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.datas,
    [],
    name="X-Ray_Hologram_V20",
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=False,
    console=False,
    disable_windowed_traceback=False,
)
