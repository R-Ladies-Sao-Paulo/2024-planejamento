formulario <- readr::read_rds("formulario.rds")


nomes_sugeridos <- formulario |>
  dplyr::distinct(quer_indicar_alguem_para_palestrar) |> 
  dplyr::pull(quer_indicar_alguem_para_palestrar)

nomes_sugeridos |> 
  writeLines()


sugestoes <- formulario |>
  dplyr::distinct(gostaria_de_oferecer_mais_alguma_sugestao_ou_criticas_quanto_aos_eventos_da_comunidade) |> 
  dplyr::pull(gostaria_de_oferecer_mais_alguma_sugestao_ou_criticas_quanto_aos_eventos_da_comunidade)

sugestoes |> 
  writeLines(sep = "\n---\n")
