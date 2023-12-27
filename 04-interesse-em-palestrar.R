formulario <- readr::read_rds("formulario.rds")


pessoas_interessadas_em_palestrar <- formulario |> 
  dplyr::select(voce_gostaria_de_palestrar_sobre_algum_assunto:mais_alguma_informacao_util) |> 
  dplyr::filter(voce_gostaria_de_palestrar_sobre_algum_assunto == "Sim") 
