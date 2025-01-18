README for PelQuesting Profiles

Overview

PelQuesting is a structured and organized questing profile system designed to simplify and automate questing in World of Warcraft: Classic Era. It is crucial to follow the folder structure and file placement as described below to ensure everything functions as intended.

Folder Structure

The entire profile system depends on maintaining a specific folder structure. All files and subdirectories must exist in the path:

Profiles\Questing\Classic\PelQuesting\*

If this structure is not followed, the profiles will not function correctly.

Root Files in PelQuesting

Within the root of the PelQuesting directory, there are two essential files:

Alliance_QuestMaster_01-60.lua

Horde_QuestMaster_01-60.lua

These files act as the primary entry points. The goal is to load one of these files depending on your faction, and everything else will auto-walk through subsequent profiles, advancing automatically as needed.

Additionally, a file named macros-cache.txt exists in the root of the PelQuesting directory. This file must be placed in the following directory before launching WoW:

C:\Program Files (x86)\World of Warcraft\_classic_era_\WTF\Account\<Your Account Folder>\

Make sure this file is correctly placed, as it is integral to the profile's proper functionality.

Work in Progress

Please note that PelQuesting is still a work in progress. This includes:

Core functionality

Logic flows

Quest sequencing

Resources and optimizations

This system is not yet polished or fully stable and should be used with caution. It is not suitable for Hardcore mode without direct oversight. Profiles may contain bugs, incomplete logic, or unexpected behavior that requires manual intervention.

Important Notes

Bolded Section: Sometimes, when loading the Quest Master files (Alliance_QuestMaster_01-60.lua or Horde_QuestMaster_01-60.lua), the first attempt may not start the profile. If this happens, click the Stop button and attempt to start it again. This will typically resolve the issue and enable the profile to function as intended.

By following the outlined instructions and paying attention to the current limitations, PelQuesting can significantly enhance your questing experience. Thank you for your patience as this project evolves.
