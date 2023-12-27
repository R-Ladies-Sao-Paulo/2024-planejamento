# Caminho para o arquivo com as respostas
url_sheets <- "https://docs.google.com/spreadsheets/d/1Ydvo55Ypu73E6MAn8KP7kZC6VXqOT393XMoaDykAMLA/edit?resourcekey#gid=2129768250"


# Importando o arquivo
formulario <- googlesheets4::read_sheet(url_sheets) |>
  janitor::clean_names() |>
  tibble::rowid_to_column() |>
  dplyr::mutate(dias_horarios = stringr::str_replace(
    em_quais_dias_e_horarios_voce_prefere_que_as_atividades_acontecam, "Durante a semana, no período noturno",
    "Durante a semana - no período noturno"
  ),
  temas = stringr::str_replace(
    quais_temas_voce_gostaria_que_fossem_abordados_em_eventos, "Analise de dados espaciais", "Análise de dados espaciais"
  ))

# Cada linha é uma resposta

readr::write_rds(formulario, "formulario.rds")
