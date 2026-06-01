---
name: project-conventions
description: >
  Describes how the to structure a project. Use when creating a new project, or
  when navigating an existing project.
---

# Project Conventions

A description of the structure of a project

## Technologies Used

The target deployment platform is Kubernetes. Helm is used to deploy the project
to Kubernetes. The `Chart.yaml` file is included in the top-level directory of
the project. The Helm template files are stored in the `templates` directory at
the top of the project structure. Within the `templates` directory, are
subdirectories that correspond to each component of the project. These
subdirectories contain files that are named with kebab-case to match the
Kubernetes resource they contain (e.g. `stateful-set.k8s.yaml`).

To build the images for Kubernetes we use `docker compose`. There is a
`compose.yaml` file at the top of the project which defines each of the
services/components and how to build them. It references a single `Dockerfile`
at the top-level of the project with multiple targets.

We use `pnpm` for package management. We use a `pnpm-workspace.yaml` at the
top-level of the project that references each of the individual packages that
make up the project.

## Sub-Package Structure

Each of the sub packages that make up the pnpm workspace are contained within
the `packages/` directory at the top-level of the project. Some common folders
within these sub-packages are as follows:

- `src`: contains TypeScript source files that constitute the application code of
  the component in question.
  - `src/index.ts`: The entry-point for the application
  - `src/services/`: Contains services that are used by the application. These
	are typically stateful services, or they connect to external services like
	databases or APIs
  - `src/plugings/`: For projects using fastify, this folder will contain the
	plugins that add functionality to the fastify app. This functionality often
	includes registering code in the `src/services/` directory in a way that
	fastify can make use of it.
  - `src/routes/`: For projects using fastify, this folder will contain the
	HTTP route definitions
  - `src/utils/`: Contains helper functions for the application. These are
	typically pure functions that are trivial to unit test.
- `dist`: contains the TypeScript build output
