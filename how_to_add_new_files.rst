===============================
Adding a New Page via GitHub UI
===============================

This guide explains how to add new documentation pages directly through the GitHub web interface without using a command line terminal.

Step 1: Create a New File
-------------------------

1. Navigate to the `NOAA-GSL/sphinx-its <https://github.com/NOAA-GSL/sphinx-its>`_ repository on GitHub.
2. Click the **Add file** dropdown button near the top-right corner and select **Create new file**.
3. In the filename input box, enter a name ending in ``.rst`` (for example, ``user-guide.rst``).
4. Add your page content using standard reStructuredText syntax:

   .. code-block:: rst

      ==================
      User Guide Title
      ==================

      Overview
      --------
      This section provides instructions for standard system operations.

      Key Topics
      ~~~~~~~~~~
      * **First Item**: Description of topic one.
      * **Second Item**: Description of topic two.

5. Click **Commit changes...** in the top-right corner.
6. Enter a descriptive commit message (e.g., *Add user guide page*) and click **Commit changes**.

Step 2: Register the Page in index.rst
--------------------------------------

Sphinx requires new pages to be added to the Table of Contents (``toctree``) in ``index.rst`` so they appear in the site navigation bar.

1. Open **``index.rst``** from the main file list on GitHub.
2. Click the **pencil icon** (Edit this file) in the upper-right toolbar.
3. Locate the ``.. toctree::`` block and add your new file name **without** the ``.rst`` extension. Match the 3-space indentation of existing entries:

   .. code-block:: rst

      .. toctree::
         :maxdepth: 2
         :caption: Contents:

         overview
         user-guide

4. Click **Commit changes...** in the top right and confirm the commit to the ``main`` branch.

Step 3: Trigger the Live Deployment
-----------------------------------

1. Open the **Actions** tab on GitHub to confirm that the **Build and Push Docker Image** workflow finishes successfully.
2. Execute the rollout command in your terminal to pull the updated container to the cluster:

   .. code-block:: bash

      kubectl rollout restart deployment/sphinx-its -n sphinx-its --context=dev-b1
