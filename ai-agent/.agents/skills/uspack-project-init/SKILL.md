---
name: uspack-project-init
description: >
  Creates a project from scratch using USPack best practices. Use when the user
  requests the creation of a new project.
---

# USPack Project Initialization

This is a skill that scaffolds a project using the best practices as established
by USPack. The following sections describe the ordered steps for initializing a
new project.

## Create PNPM Workspace

Create a copy of [pnpm-workspace.yaml](assets/pnpm-workspace.yaml) at the
top-level of the directory.

Also create a [package.json](assets/package.json)

## Create Docker Build

Create copies of the [compose.yaml](assets/compose.yaml) and
[Dockerfile](assets/Dockerfile) at the top-level of the project directory.

## Create Components

You will then need to determine what components the user wants to initialize in
this project. Repeat the workflow described in this section until the user
indicates they do not wish to create any additional components.

Prompt the user for a name of the component. Throughout this section the
placehold `foo` will be used to refer to the value the user provided when
prompted for the component name.

### Patch Compose

Create a new `service` in the top-level compose.yaml bearing the component name.
An example is shown below:

```yaml
services:
  foo:
    build:
      target: node-component
      args:
        NODE_COMPONENT: foo
```

### Create NPM Package

An NPM package should be created at the path `packages/foo/package.json`. The
`package.json` should have the name set to `@fleetgistics/foo`.

It should also have the following scripts defined:
- compile
- dev
- test:unit

Run the following commands to install initial required packages:

```bash
pnpm -F foo add typebox env-schema
pnpm -F foo add -D typescript @tsconfig/node24
```

