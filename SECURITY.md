# Security Policy

Report vulnerabilities via **GitHub private security advisories** on the relevant repo
(`Security → Report a vulnerability`), not a public issue. We aim to acknowledge promptly and credit reporters.

**Maintainers should enable:** branch protection on `main` (PR review, no force-push), Dependabot alerts,
secret scanning + push protection, required 2FA, CodeQL on code repos, and SHA-pinned GitHub Actions.

Out of scope: third-party hosts (GitHub, Cloudflare) — report to them. No testing against third-party
infrastructure; no social engineering. See https://ilm.codes/security/
