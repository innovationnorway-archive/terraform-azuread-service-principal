## 3.0.0 (April 23, 2020)

BREAKING CHANGES:

- Use the `time` provider to create a rotating RFC3339 timestamp, and trigger recreation of resources when current time has passed the rotation. ([#12](https://github.com/innovationnorway/terraform-azuread-service-principal/pull/12))
- Use resource `for_each` for repetition over `scopes`. ([#12](https://github.com/innovationnorway/terraform-azuread-service-principal/pull/12))
- Add `years` argument for setting the number of years after which the password expire. ([#12](https://github.com/innovationnorway/terraform-azuread-service-principal/pull/12))

ENHANCEMENTS:

- Only constrain the minimum allowed `required_version`. ([#12](https://github.com/innovationnorway/terraform-azuread-service-principal/pull/12))

---

For information on earlier releases, see their changelogs:

- [v1.0.4](https://github.com/innovationnorway/terraform-azuread-service-principal/blob/v1.0.4/CHANGELOG.md)
