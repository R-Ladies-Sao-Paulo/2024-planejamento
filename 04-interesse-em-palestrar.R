formulario <- readr::read_rds("formulario.rds")


pessoas_interessadas_em_palestrar <- formulario |> 
  dplyr::select(voce_gostaria_de_palestrar_sobre_algum_assunto:voce_faz_parte_de_algum_grupo_sub_representado_em_ciencia_de_dados) |> 
  dplyr::filter(voce_gostaria_de_palestrar_sobre_algum_assunto == "Sim") 
