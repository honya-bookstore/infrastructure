module.exports = {
  branchPrefix: "honyabookstore-renovate/",
  platform: "github",
  onboarding: false,
  platformCommit: "enabled",
  repositories: [process.env.RENOVATE_GITHUB_REPOSITORY],
  extends: [
    `local>${process.env.RENOVATE_GITHUB_REPOSITORY_OWNER}/renovate-config`,
  ],
  automerge: true,
  enabledManagers: ["kustomize"],
  kustomize: {
    managerFilePatterns: ["(^|/)kustomization\\.ya?ml$"],
    packageRules: [
      {
        matchPackageNames: process.env.RENOVATE_TARGET_IMAGES.split(","),
        matchUpdateTypes: ["major", "minor", "patch", "digest"],
      },
    ],
  },
};
