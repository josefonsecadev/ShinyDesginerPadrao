---
name: brand-yml
description: "Criar e aplicar arquivos _brand.yml para padronizar cores, tipografia e logos em aplicações Shiny R."
metadata:
  author: Garrick Aden-Buie (@gadenbuie)
  version: "1.1"
license: MIT
---

# brand.yml para Shiny R

Use `_brand.yml` como fonte configurável de identidade visual para aplicações Shiny R e componentes que precisam respeitar o tema do consumidor.

## Escopo

Esta skill cobre criação, alteração, validação e integração de `_brand.yml` com Shiny R e bslib. Não use para outras plataformas ou documentos.

## Arquivo e estrutura

- Prefira o nome `_brand.yml` para descoberta automática.
- Coloque o arquivo na raiz da aplicação ou em um caminho compartilhado explicitamente informado.
- Consulte [a especificação](references/brand-yml-spec.md) antes de criar ou alterar a estrutura.
- Defina cores e fontes na paleta antes de referenciá-las semanticamente.
- Use caminhos relativos ao arquivo para logos e outros assets.

Estrutura mínima:

```yaml
color:
  palette:
    brand-blue: "#0066cc"
  primary: brand-blue
  background: "#ffffff"

typography:
  fonts:
    - family: Inter
      source: google
      weight: [400, 600]
  base: Inter
```

## Fluxos

### Criar ou alterar

1. Identifique cores, fontes, logos e metadados necessários.
2. Leia a especificação e preserve os nomes já usados por referências existentes.
3. Faça a menor alteração que atenda à identidade visual.
4. Valide YAML, referências de cores, fontes, caminhos e URLs.

### Aplicar em Shiny R

Leia [o guia de Shiny R](references/shiny-r.md) para integração detalhada. Os padrões principais são:

```r
theme <- bslib::bs_theme(brand = TRUE)
theme <- bslib::bs_theme(brand = "path/to/_brand.yml")
```

Use descoberta automática quando `_brand.yml` estiver na raiz da aplicação e caminho explícito quando houver mais de uma configuração.

### Diagnosticar

- Confirme o nome e a localização do arquivo.
- Verifique se referências semânticas apontam para nomes existentes na paleta.
- Confirme que fontes e pesos declarados estão disponíveis.
- Verifique a ordem de carregamento do tema quando houver `bs_theme()` customizado.

## Referências

- [brand-yml-spec.md](references/brand-yml-spec.md): campos e validação do formato.
- [shiny-r.md](references/shiny-r.md): integração com Shiny R e bslib.
