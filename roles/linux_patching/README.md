Role Name
=========

This role handles patching all US(currently) Linux Servers at MetLife.

Role Variables
--------------

Coming soon

Required Tags
----------------
User Tags:

The tags below can be called by users in their AAP templates.

- update - runs update task as well as reboot tasks if needed
- service1 - conditionally restarts service1 if there is an update but no reboot required

Non-User Tags:

The tags below are automatic and should not be called by users.

- always- runs setup, check reboot flag and print reboot flag status if no tags are given
- never - never runs update task or reboot task unless update tag is used

Coming Soon:

- chkrpmdb - this will check for and fix any rpmdb corruption that's found.

Contributor Information
------------------
