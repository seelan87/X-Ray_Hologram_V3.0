# X-Ray Hologram V20 — Windows EXE build

This repository packages the uploaded `X-Ray_Hologram_V20.ipynb` application into Windows executables.

## Why the previous GitHub run failed

The Node.js 20 messages are **warnings/deprecation notices**, not the actual Python/PyInstaller exit-code error. The old workflow also used older action versions and the previous `.spec` file contained an accidental leading `\` character.

This package fixes the packaging workflow and adds dependency/architecture checks so a failed build reports the real failing stage.

## Builds

| Target | Python | Dependency set | Output |
|---|---|---|---|
| Windows x64 | 3.11 64-bit | `requirements-x64.txt` | `X-Ray_Hologram_V20-Windows-x64.zip` |
| Windows x86 | 3.8 32-bit | `requirements-x86.txt` | `X-Ray_Hologram_V20-Windows-x86.zip` |

The x86 dependency set is deliberately pinned to older Windows `win32` wheels. For example, PyPI provides Windows x86 wheels for SciPy 1.9.0, pandas 1.5.3, Matplotlib 3.7.5, scikit-image 0.19.3, Pillow 9.5.0 and h5py 2.10.0. This avoids trying to compile those native packages from source on the GitHub runner. citeturn12search0turn12search1turn3search0turn7search0turn11search0turn10search0

PyInstaller builds for the architecture of the Python interpreter used to run it, so x64 must be built with 64-bit Python and x86 with 32-bit Python. citeturn1search3

## GitHub Actions (Windows 11)

The workflow uses the Microsoft-hosted `windows-2022` runner, which is the appropriate Windows environment for producing Windows 11-compatible executables. It builds both x64 and x86 packages and verifies that the EXE exists before uploading it.

The workflow uses Python 3.10 with the matching architecture for each build.

## GitHub Actions

The workflow now uses Node 24-compatible/current action releases: `actions/checkout@v6`, `actions/setup-python@v7`, and `actions/upload-artifact@v6`. The latter two action families have current Node 24 releases, and upload-artifact v6 runs on Node 24. citeturn1search6turn1search2turn8search0

Push the repository to GitHub, then use **Actions → Build Windows EXE → Run workflow**. The workflow also runs automatically for tags beginning with `v`.

## Local builds

### x64

Install 64-bit Python 3.11 and run:

```bat
build_windows_x64.bat
```

### x86

Install 32-bit Python 3.8 and run:

```bat
build_windows_x86.bat
```

The x86 build intentionally uses Python 3.8 because the required native dependencies have compatible Windows `win32` wheels for that generation; the application code contains f-strings and therefore cannot simply be moved to Python 3.5, even though very old h5py x86 installers existed there.

## Important runtime note

The EXE packages the application and its Python dependencies. It does **not** embed the user's HDF5/other experimental data files; the GUI continues to open user-selected files at runtime.

## Build Windows 11 x64 EXE

In GitHub, open **Actions → Build X-Ray Hologram V20 - Windows 11 x64 EXE → Run workflow**.

The workflow uses a Windows 2022 runner and **64-bit Python 3.10**. It verifies that Python is 64-bit before running PyInstaller.

The successful artifact is:

```text
X-Ray_Hologram_V20-Windows-x64.zip
└── X-Ray_Hologram_V20.exe
```

The EXE is built for 64-bit Windows and is intended for Windows 11.
