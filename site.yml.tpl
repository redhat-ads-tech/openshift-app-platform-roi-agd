- hosts: localhost
  gather_facts: false
  collections:
    - rhdp.workshop
  roles:
    - role: ocp4_app_platform_roi
      vars:
        ACTION: provision
        common_password: REPLACE_ME
