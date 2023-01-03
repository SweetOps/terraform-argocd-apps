# terraform-module-template

<!-- BEGIN_TF_DOCS -->
## Usage
```hcl
module "aweasome_module" {
  source    = "../../"
  name      = "aweasome"
  stage     = "production"
  namespace = "sweetops"
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_argocd"></a> [argocd](#requirement\_argocd) | >= 1.2 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_argocd"></a> [argocd](#provider\_argocd) | >= 1.2 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apps_label"></a> [apps\_label](#module\_apps\_label) | cloudposse/label/null | 0.25.0 |
| <a name="module_this"></a> [this](#module\_this) | cloudposse/label/null | 0.25.0 |
## Resources

| Name | Type |
|------|------|
| [argocd_application.apps](https://registry.terraform.io/providers/oboukili/argocd/latest/docs/resources/application) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apps"></a> [apps](#input\_apps) | n/a | <pre>list(object(<br>    {<br>      name        = string<br>      repository  = string<br>      version     = string<br>      cluster     = string<br>      project     = string<br>      namespace   = optional(string, "default")<br>      chart       = optional(string, "")<br>      path        = optional(string, "")<br>      values      = optional(string, "")<br>      skip_crds   = optional(bool, false)<br>      value_files = optional(list(string), [])<br>      max_history = optional(number, 10)<br>      sync_wave   = optional(number, 50)<br>      annotations = optional(map(string), {})<br>      ignore_differences = optional(<br>        list(object(<br>          {<br>            group             = optional(string)<br>            kind              = optional(string)<br>            jqPathExpressions = optional(list(string))<br>            jsonPointers      = optional(list(string))<br>          }<br>        ))<br>      )<br>      sync_options = optional(list(string), ["CreateNamespace=true", "ApplyOutOfSyncOnly=true"])<br><br>      retry = optional(<br>        object(<br>          {<br>            limit                = optional(number)<br>            backoff_duration     = optional(string)<br>            backoff_max_duration = optional(string)<br>            backoff_factor       = optional(number)<br>          }<br>        ),<br>        {<br>          limit                = 0<br>          backoff_duration     = "30s"<br>          backoff_max_duration = "1m"<br>          backoff_factor       = 2<br>        }<br>      )<br><br>      automated = optional(<br>        object(<br>          {<br>            prune       = optional(bool)<br>            self_heal   = optional(bool)<br>            allow_empty = optional(bool)<br>          }<br>        ),<br>        {<br>          prune       = true<br>          self_heal   = true<br>          allow_empty = true<br>        }<br>      )<br><br>      managed_namespace_metadata = optional(<br>        object(<br>          {<br>            labels      = optional(map(string))<br>            annotations = optional(map(string))<br>          }<br>      ), {})<br>    }<br>  ))</pre> | n/a | yes |
| <a name="input_parent_app"></a> [parent\_app](#input\_parent\_app) | A parent app configuration. | <pre>object(<br>    {<br>      name         = string<br>      namespace    = optional(string, "argo")<br>      annotations  = optional(map(string))<br>      project      = optional(string)<br>      wait         = optional(bool, false)<br>      sync_options = optional(list(string), ["CreateNamespace=true", "ApplyOutOfSyncOnly=true"])<br><br>      helm = optional(<br>        object(<br>          {<br>            repository = optional(string)<br>            chart      = optional(string)<br>            version    = optional(string)<br>          }<br>        ),<br>        {<br>          repository = "https://rallyware.github.io/terraform-argocd-apps"<br>          chart      = "argocd-app-of-apps"<br>          version    = "0.1.0"<br>        }<br>      )<br><br>      timeouts = optional(<br>        object(<br>          {<br>            create = optional(string)<br>            update = optional(string)<br>            delete = optional(string)<br>          }<br>        ),<br>        {<br>          create = "60m"<br>          update = "60m"<br>          delete = "60m"<br>        }<br>      )<br><br>      retry = optional(<br>        object(<br>          {<br>            limit                = optional(number)<br>            backoff_duration     = optional(string)<br>            backoff_max_duration = optional(string)<br>            backoff_factor       = optional(number)<br>          }<br>        ),<br>        {<br>          limit                = 0<br>          backoff_duration     = "30s"<br>          backoff_max_duration = "1m"<br>          backoff_factor       = 2<br>        }<br>      )<br><br>      destination = optional(<br>        object(<br>          {<br>            name      = optional(string)<br>            namespace = optional(string)<br>          }<br>        ),<br>        {<br>          name      = "in-cluster"<br>          namespace = "argo"<br>        }<br>      )<br><br>      automated = optional(<br>        object(<br>          {<br>            prune       = optional(bool)<br>            self_heal   = optional(bool)<br>            allow_empty = optional(bool)<br>          }<br>        ),<br>        {<br>          prune       = true<br>          self_heal   = true<br>          allow_empty = true<br>        }<br>      )<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apps"></a> [apps](#output\_apps) | A list of deployed apps |
<!-- END_TF_DOCS -->

## License
The Apache-2.0 license