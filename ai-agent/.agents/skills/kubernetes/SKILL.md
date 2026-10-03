---
name: kubernetes
description: >
  Describes naming conventions within a Kubernetes cluster, and how to properly
  navigate and interact with it. Use whenever you need to interact with
  Kubernetes via `kubectl`.
---

## Cluster Contexts

Each cluster corresponds to an environment. The production versions of workloads
are deployed in the `primary` cluster. The staging versions of workloads are
deployed within the `dev` cluster. The `legacy` cluster contains workloads which
are eventually being discharged from the business. Each of these clusters can be
accessed with the `kubectl` context sharing the same name.

## Namespace Conventions

Each namespace corresponds to a single application within the cluster. Resources
within the namespace typically have a hyphenated suffix applied to indicate what
stage/environment they belong to (e.g. `api-staging`).

The prefix attached to the name of the namespace can indicate what kind of
workload the application is:

- **app-**: This indicates the workload is end-user facing and primarily exposes
  a web-frontend for the user to interact with.

- **api-**: This indicates the workload is public-facing, but primarily exposes
  a REST API for external entities to interact with.

- **int-**: This indicates the workload is an integration. Typically this is
  either a customer specific integration, or an integration with a common system
  type.

- **micro-**: These are microservices that are for internal use only. Typically
  they expose a narrowly focused REST API for performing functionality common to
  other workloads.

- **auto-**: These are process which are "headless" automations. They typically
  don't interact with users directly at all. They typically consist primarily of
  cron jobs, or webhooks.

## Configuration

Workloads are configured via `ConfigMaps` and `Secrets`. These instances of
these 2 resources are typically narrowly focused in the configuration they
provided. This allows configuration to be easily composed without providing
unnecessary sensitive information to a workload.

The names of the ConfigMaps and Secrets typically have a hyphenated suffix that
either indicates the stage the configuration belongs to, or indicates the
configuration is shared "globally" across stages. An example of each
respectively is `db-staging` and `ec-global`.
