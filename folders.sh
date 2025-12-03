#!/bin/bash

# ORG
mkdir -p infra/org/folders
mkdir -p infra/org/iam
mkdir -p infra/org/services
mkdir -p infra/org/billing
mkdir -p infra/org/policies

# NETWORKING – fd-net-usc
# Clinical
mkdir -p infra/networking/fd-net-usc/clinical/prj-net-clin-prod-int-usc
mkdir -p infra/networking/fd-net-usc/clinical/prj-net-clin-prod-ext-usc
mkdir -p infra/networking/fd-net-usc/clinical/prj-net-clin-prod-res-usc
mkdir -p infra/networking/fd-net-usc/clinical/prj-net-clin-nonprod-int-usc
mkdir -p infra/networking/fd-net-usc/clinical/prj-net-clin-nonprod-ext-usc

# Enterprise
mkdir -p infra/networking/fd-net-usc/enterprise/prj-net-ent-prod-int-usc
mkdir -p infra/networking/fd-net-usc/enterprise/prj-net-ent-prod-ext-usc
mkdir -p infra/networking/fd-net-usc/enterprise/prj-net-ent-prod-res-usc
mkdir -p infra/networking/fd-net-usc/enterprise/prj-net-ent-nonprod-int-usc
mkdir -p infra/networking/fd-net-usc/enterprise/prj-net-ent-nonprod-ext-usc

# Research
mkdir -p infra/networking/fd-net-usc/research/prj-net-res-prod-int-usc
mkdir -p infra/networking/fd-net-usc/research/prj-net-res-prod-ext-usc
mkdir -p infra/networking/fd-net-usc/research/prj-net-res-prod-res-usc
mkdir -p infra/networking/fd-net-usc/research/prj-net-res-nonprod-int-usc
mkdir -p infra/networking/fd-net-usc/research/prj-net-res-nonprod-ext-usc

mkdir -p infra/networking/shared_vpc
mkdir -p infra/networking/common

# SECURITY — VPC-SC
mkdir -p infra/security/vpc_sc/clinical
mkdir -p infra/security/vpc_sc/enterprise
mkdir -p infra/security/vpc_sc/research
mkdir -p infra/security/vpc_sc/common

# SECURITY — ORG POLICIES
mkdir -p infra/security/org_policies/global
mkdir -p infra/security/org_policies/clinical
mkdir -p infra/security/org_policies/enterprise
mkdir -p infra/security/org_policies/research

# PROJECT FACTORY
mkdir -p infra/project-factory/host
mkdir -p infra/project-factory/service

# DOMAINS — Clinical / Synthea DE
mkdir -p infra/domains/clinical/prj-de-synthea-prod/bigquery
mkdir -p infra/domains/clinical/prj-de-synthea-prod/storage
mkdir -p infra/domains/clinical/prj-de-synthea-prod/iam
mkdir -p infra/domains/clinical/prj-de-synthea-prod/dataflow
mkdir -p infra/domains/clinical/prj-de-synthea-prod/atlas_integration

mkdir -p infra/domains/clinical/prj-de-synthea-nonprod/bigquery
mkdir -p infra/domains/clinical/prj-de-synthea-nonprod/storage
mkdir -p infra/domains/clinical/prj-de-synthea-nonprod/iam
mkdir -p infra/domains/clinical/prj-de-synthea-nonprod/dataflow
mkdir -p infra/domains/clinical/prj-de-synthea-nonprod/atlas_integration

# DOMAINS — Enterprise DE
mkdir -p infra/domains/enterprise/prj-de-finance-analytics-prod
mkdir -p infra/domains/enterprise/prj-de-finance-analytics-nonprod
mkdir -p infra/domains/enterprise/prj-de-hr-analytics-prod
mkdir -p infra/domains/enterprise/prj-de-hr-analytics-nonprod

# DOMAINS — Research ML
mkdir -p infra/domains/research/prj-ml-imaging-prod
mkdir -p infra/domains/research/prj-ml-imaging-nonprod
mkdir -p infra/domains/research/prj-ml-experiments-prod
mkdir -p infra/domains/research/prj-ml-experiments-nonprod

# GOVERNANCE — Atlas
mkdir -p infra/governance/prj-data-governance-atlas-prod/compute
mkdir -p infra/governance/prj-data-governance-atlas-prod/network
mkdir -p infra/governance/prj-data-governance-atlas-prod/iam
mkdir -p infra/governance/prj-data-governance-atlas-prod/config
mkdir -p infra/governance/prj-data-governance-atlas-prod/connectors

mkdir -p infra/governance/prj-data-governance-atlas-nonprod/compute
mkdir -p infra/governance/prj-data-governance-atlas-nonprod/network
mkdir -p infra/governance/prj-data-governance-atlas-nonprod/iam
mkdir -p infra/governance/prj-data-governance-atlas-nonprod/config
mkdir -p infra/governance/prj-data-governance-atlas-nonprod/connectors

# MODULES
mkdir -p infra/modules/folder
mkdir -p infra/modules/project
mkdir -p infra/modules/networking
mkdir -p infra/modules/vpc_sc
mkdir -p infra/modules/iam
mkdir -p infra/modules/compute

echo "✅ Folder structure created successfully."

