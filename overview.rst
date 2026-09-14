=====================
ITS System Overview
=====================

Infrastructure Summary
----------------------
This website is hosted on the **dev-b1** Kubernetes cluster (`rancher-b1.gsd.esrl.noaa.gov`) and deployed using GitHub Container Registry.

Key Features
~~~~~~~~~~~~
* **Automated Builds**: Updates pushed to GitHub trigger an automated container image rebuild.
* **High Availability**: Runs in a managed container environment backed by `vastdata-filesystem` storage.
* **Sphinx Engine**: Uses standard Python Sphinx for rendering documentation.
