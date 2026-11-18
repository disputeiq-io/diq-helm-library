# diq-helm-library

Shared Helm library chart (`type: library`) providing production-hardened Kubernetes
and Istio ambient mesh templates for DisputeIQ services:

- `diq.serviceAccount` (`automountServiceAccountToken: false`)
- `diq.deployment` (restricted PSS, `readOnlyRootFilesystem`, non-root, startup/liveness/readiness probes, `tmp` emptyDir)
- `diq.service` (`ClusterIP`)
- `diq.pdb` (`PodDisruptionBudget` when `replicaCount > 1`)
- `diq.authorizationPolicy` (Istio SPIFFE caller allow-list)
