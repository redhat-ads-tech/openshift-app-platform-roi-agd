# LB2863 - Unlocking OpenShift's Full Value

Ansible role for deploying the LB2863 workshop environment: Unlocking OpenShift's Full Value - Using Application Platform Capabilities that Bring Real ROI for Your Apps.

## Installation

```bash
ansible-galaxy collection install rhdp.workshop
```

## Roles

### ocp4_app_platform_roi

Deploys a complete platform engineering stack on OpenShift, including developer portals, CI/CD pipelines, GitOps (for user apps), security tools, and more. This role provides a comprehensive workshop environment for learning and demonstrating platform engineering best practices.

#### Components Deployed

The role deploys and configures the following components:

- **OpenShift Pipelines** - Tekton-based CI/CD pipelines
- **Red Hat Developer Hub (RHDH)** - Internal developer portal based on Backstage
- **GitLab** - Source code management and CI/CD platform
- **Red Hat Build of Keycloak (RHBK)** - Identity and access management with OAuth integration
- **Quay** - Container image registry
- **HashiCorp Vault** - Secrets management
- **External Secrets Operator** - Integrates external secret management systems with Kubernetes
- **Red Hat Trusted Artifact Signer (RHTAS)** - Software supply chain security with Sigstore
- **NooBaa** - S3-compatible object storage (optional, configurable)
- **Parasol Insurance** - Demo application for workshop scenarios
- **Web Terminal** - Browser-based terminal access (optional)

## Quick Start

```yaml
- name: Deploy LB2863 Workshop
  hosts: localhost
  tasks:
    - name: Deploy LB2863 workshop environment
      ansible.builtin.include_role:
        name: rhdp.workshop.ocp4_app_platform_roi
      vars:
        ACTION: provision
        common_password: changeme
```

## Requirements

- OpenShift 4.x cluster
- cluster-admin access
- `kubernetes.core` collection
- Sufficient cluster resources for all components

## Configuration

The role provides extensive configuration options through variables. Key variables include:

- `ACTION` - Set to `provision` or `destroy`
- `common_password` - Default password for workshop users
- `ocp4_app_platform_roi_noobaa_install` - Enable/disable NooBaa installation (default: true)
- `ocp4_app_platform_roi_terminal_install` - Enable/disable Web Terminal (default: true)

See [defaults/main.yml](roles/ocp4_app_platform_roi/defaults/main.yml) for all available configuration options.

## License

GPL-2.0-or-later
