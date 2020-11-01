# `/internal`

Private application and library code. This is the code we don't want
others importing in their applications or libraries. Note that this
layout pattern is enforced by the Go compiler itself. See the Go 1.4
[`release notes`](https://golang.org/doc/go1.4#internalpackages) for
more details.

Since it's nice to have visual clues showing the intended package
use, we put application code in the `/internal/app` directory and
the code shared by those apps in the `/internal/pkg` directory.
Furthermore, we make sure code that wraps vicidial's custom legacy
database layout, goes into `/internal/legacy`.

- `/internal/legacy/adapters/` &rarr; `vicidal-mysql`
- `/internal/legacy/app/`      &rarr; `event-router --legacy`
- `/internal/legacy/handlers/` &rarr; `vmanager2ari`, `eventlog2sip_event_log`, ...
- `/internal/pkg/adapters/`    &rarr; `asterisk-ari`
- `/internal/pkg/handlers/`    &rarr; `ari2eventlog`
- `/internal/app/`             &rarr; `event-router`, `predictive-dialer`
Modules in this folder, except for `./common` and `./legacy` obey to
Clean Architecture principles and represent a business subdomain.

- `./common` - common code between the modules
- `./legacy` - anti-corruption layer to lagacy vicidial codebase

## Monolith & Microservice deployments

Modules implement interfaces for both, running them as a monolit
or as microservices.

Rationale: https://threedots.tech/post/microservices-or-monolith-its-detail/
Example: https://github.com/ThreeDotsLabs/monolith-microservice-shop

