
prep_raw <- formulario |> 
  dplyr::select(rowid, tema = quais_temas_voce_gostaria_que_fossem_abordados_em_eventos) |> 
  tidyr::separate_longer_delim(tema, ",") |> 
  dplyr::mutate(tema = stringr::str_trim(tema), quantidade_temas = dplyr::n_distinct(tema)) |> 
  dplyr::group_by(rowid) |> 
  dplyr::mutate(quantidade_temas_selecionados = dplyr::n()) |> 
  dplyr::ungroup() |> 
  dplyr::mutate(prop_qtd_temas = quantidade_temas_selecionados / quantidade_temas) |> 
  dplyr::filter(prop_qtd_temas < 0.5) |> 
  tidyr::drop_na(tema)

prep <- prep_raw  |> 
  dplyr::mutate(valor = 1) |> 
  dplyr::select(rowid, valor, tema) |> 
  tidyr::pivot_wider(names_from = tema, values_from = valor, values_fill = 0)  |>
  dplyr::mutate(dplyr::across(.cols = everything(), .fns = as.factor)) |> 
  dplyr::select(-rowid)
  
# resultado_mca <- FactoMineR::MCA(prep, graph = TRUE) 
# 
# factoextra::fviz_mca_biplot(resultado_mca)


cluster <- hclust(dist(prep))

factoextra::fviz_dend(cluster, k = 3)

grupos <- factoextra::hcut(prep, k = 3)

cluster_df <- tibble::tibble(cluster = grupos$cluster) |> 
  tibble::rowid_to_column() |> 
  dplyr::left_join(prep_raw, by = "rowid") |>
  dplyr::group_by(rowid) |> 
  dplyr::mutate(quantidade_temas_selecionados = dplyr::n()) |> 
  dplyr::ungroup() 

cluster_df |> 
  dplyr::group_by(cluster) |> 
  dplyr::count(tema) 
