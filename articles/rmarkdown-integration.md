# R Markdown and Quarto Integration

## Overview

ggcatppuccin can style not just your plots, but your entire R Markdown
or Quarto document using CSS generated from the Catppuccin palettes.

## Generating CSS

Use
[`catppuccin_css()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/catppuccin_css.md)
to generate a CSS string, or
[`write_catppuccin_css()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/catppuccin_css.md)
to write it to a file:

``` r
library(ggcatppuccin)

# Generate CSS string
css_text <- catppuccin_css("mocha")
cat(substr(css_text, 1, 200), "...")
#> :root {
#>   --catppuccin-base: #1e1e2e;
#>   --catppuccin-surface: #313244;
#>   --catppuccin-text: #cdd6f4;
#>   --catppuccin-subtext: #bac2de;
#>   --catppuccin-accent: #cba6f7;
#> }
#> 
#> body {
#>   background-color: var( ...
```

Write to a file:

``` r
write_catppuccin_css("catppuccin.css", flavor = "mocha")
```

## Using in R Markdown

In your R Markdown YAML header:

``` yaml
---
title: "My Document"
output:
  html_document:
    css: catppuccin.css
---
```

Or with a custom knit hook:

```` markdown
---
title: "My Document"
output: html_document
---

```{r setup, include=FALSE}
library(ggcatppuccin)
write_catppuccin_css("catppuccin.css", flavor = "mocha")
```
````

Then reference it:

``` yaml
---
title: "My Document"
output:
  html_document:
    css: catppuccin.css
---
```

## Using in Quarto

For Quarto documents:

``` yaml
---
title: "My Document"
format:
  html:
    css: catppuccin.css
---
```

Or generate dynamically:

```` markdown
```{r}
#| include: false
library(ggcatppuccin)
write_catppuccin_css("catppuccin.css", flavor = "latte")
```
````

## Coordinated Documents

Set the flavor once and use it throughout:

```` markdown
```{r setup, include=FALSE}
library(ggplot2)
library(ggcatppuccin)

# Set flavor for session
set_catppuccin_flavor("macchiato")

# Generate matching CSS
write_catppuccin_css("catppuccin.css")
```

Now all plots and the document styling will match:

```{r}
ggplot(mtcars, aes(mpg, wt, color = factor(cyl))) +
  geom_point(size = 3) +
  scale_color_catppuccin() +  # Uses macchiato
  theme_catppuccin()           # Uses macchiato
```
````

## What Gets Styled

The generated CSS styles:

- **Body background** - Uses base color
- **Text color** - Uses text color
- **Links** - Uses accent color (mauve)
- **Code blocks** - Uses surface0 background
- **Blockquotes** - Uses accent border and surface0 background

## Example: Full Document

Here’s a complete example:

```` markdown
---
title: "Analysis Report"
author: "Your Name"
date: "2026-01-18"
output:
  html_document:
    css: catppuccin.css
---

```{r setup, include=FALSE}
library(ggplot2)
library(ggcatppuccin)

set_catppuccin_flavor("frappe")
write_catppuccin_css("catppuccin.css")

knitr::opts_chunk$set(echo = TRUE, fig.width = 7, fig.height = 4)
```

## Overview

This report uses the **Catppuccin Frappé** theme throughout.

## Analysis

```{r}
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
  geom_point(size = 2) +
  scale_color_catppuccin() +
  theme_catppuccin() +
  labs(title = "Iris Dataset Analysis")
```

> Note: All colors are coordinated using the Catppuccin palette.

## Code Example

```{r}
summary(iris)
```
````

## Different Flavors for Different Purposes

- **Latte** - Light theme, good for printing
- **Frappé** - Balanced, works well on most screens
- **Macchiato** - Darker, easier on eyes in low light
- **Mocha** - Darkest, best for dark mode enthusiasts

## Tips

1.  **Consistency**: Use
    [`set_catppuccin_flavor()`](https://zhenyakosovan.github.io/ggcatppuccin/reference/set_catppuccin_flavor.md)
    once at the start
2.  **File location**: Keep CSS file in the same directory as your .Rmd
3.  **Version control**: Optionally add `*.css` to `.gitignore` if
    generating dynamically
4.  **Testing**: Preview with different flavors to see which works best
