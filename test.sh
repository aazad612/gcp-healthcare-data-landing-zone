# --- Root-level infra + docs scaffolding ---
mkdir -p infra
mkdir -p docs

# ----------------------------------------------------------------------------------------------------------------------
# 1) ORG / POLICIES / PROJECTS
# ----------------------------------------------------------------------------------------------------------------------
mkdir -p infra/org/folders \
         infra/org/iam \
         infra/org/services \
         infra/org/billing \
         infra/org/policies

mkdir -p infra/projects/host \
         infra/projects/service

# ----------------------------------------------------------------------------------------------------------------------
# 2) NETWORKING – matches fd-networking / fd-net-usc / clinical|enterprise|research
# ----------------------------------------------------------------------------------------------------------------------
# Top-level networking + region
mkdir -p infra/networking/fd-net-usc

# Per-domain under fd-net-usc (clinical, enterprise, research)
mkdir -p infra/networking/fd-net-usc/clinical \
         infra/networking/fd-net-usc/enterprise \
         infra/networking/fd-net-usc/research

# Inside each domain, keep separate spaces for prod/nonprod if you want per-domain tf later
mkdir -p infra/networking/fd-net-usc/clinical/prod \
         infra/networking/fd-net-usc/clinical/nonprod \
         infra/networking/fd-net-usc/enterprise/prod \
         infra/networking/fd-net-usc/enterprise/nonprod \
         infra/networking/fd-net-usc/research/prod \
         infra/networking/fd-net-usc/research/nonprod

# Shared VPC + common networking components (generic modules / wiring)
mkdir -p infra/networking/shared_vpc \
         infra/networking/common

# ----------------------------------------------------------------------------------------------------------------------
# 3) VPC SERVICE CONTROLS – per domain
# ----------------------------------------------------------------------------------------------------------------------
mkdir -p infra/vpc_sc/clinical \
         infra/vpc_sc/enterprise \
         infra/vpc_sc/research

# Optional: shared definitions (access policy, common access levels)
mkdir -p infra/vpc_sc/common

# ----------------------------------------------------------------------------------------------------------------------
# 4) ORG POLICY – global + domain-specific policy overlays
# ----------------------------------------------------------------------------------------------------------------------
mkdir -p infra/org_policies/global \
         infra/org_policies/clinical \
         infra/org_policies/enterprise \
         infra/org_policies/research

# ----------------------------------------------------------------------------------------------------------------------
# 5) DATA PLATFORM – medallion + synthea-focused resources + Apache Atlas
# ----------------------------------------------------------------------------------------------------------------------
# Medallion model infra (BigQuery datasets, GCS buckets, etc.)
mkdir -p infra/data_platform/medallion/bronze \
         infra/data_platform/medallion/silver \
         infra/data_platform/medallion/gold

# Synthea-specific infra (projects, SA, permissions, buckets)
mkdir -p infra/data_platform/synthea/projects \
         infra/data_platform/synthea/storage \
         infra/data_platform/synthea/bigquery

# Apache Atlas infra (VMs/containers, networking, integration)
mkdir -p infra/data_platform/atlas/infra \
         infra/data_platform/atlas/config \
         infra/data_platform/atlas/metadata_models

# ----------------------------------------------------------------------------------------------------------------------
# 6) ENVIRONMENT LAYER – prod / nonprod / shared wiring
# ----------------------------------------------------------------------------------------------------------------------
mkdir -p infra/environments/prod \
         infra/environments/nonprod \
         infra/environments/shared

# ----------------------------------------------------------------------------------------------------------------------
# 7) WORKLOAD / PIPELINE CODE – Synthea + transforms (non-Terraform)
# ----------------------------------------------------------------------------------------------------------------------
mkdir -p workloads/synthea/raw \
         workloads/synthea/bronze \
         workloads/synthea/silver \
         workloads/synthea/gold \
         workloads/synthea/config \
         workloads/synthea/scripts

# Optional: Apache Atlas integration scripts, lineage exporters, etc.
mkdir -p workloads/atlas/integration \
         workloads/atlas/lineage_export \
         workloads/atlas/sync_jobs

# ----------------------------------------------------------------------------------------------------------------------
# 8) TRAINING & ARCH DOCS
# ----------------------------------------------------------------------------------------------------------------------
mkdir -p docs/architecture \
         docs/networking \
         docs/vpc_sc \
         docs/org_policies \
         docs/medallion \
         docs/trainings

