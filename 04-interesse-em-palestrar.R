formulario <- readr::read_rds("formulario.rds")


pessoas_interessadas_em_palestrar <- formulario |> 
  dplyr::select(voce_gostaria_de_palestrar_sobre_algum_assunto:voce_faz_parte_de_algum_grupo_sub_representado_em_ciencia_de_dados) |> 
  dplyr::filter(voce_gostaria_de_palestrar_sobre_algum_assunto == "Sim") 


pessoas_interessadas_em_palestrar |> 
  dplyr::select(
    nome = qual_e_o_seu_nome,
    email = qual_e_o_seu_email,
    temas = qual_tema_voce_gostaria_de_palestrar,
    tipos_de_atividades = em_quais_tipos_de_atividades_voce_preferiria_palestrar,
  ) |> 
  writexl::write_xlsx("pessoas-interessadas-em-palestrar.xlsx")
