SELECT wp_2_posts.ID, wp_2_posts.post_content, wp_2_posts.post_date, tmp_last.slg
 
 FROM wp_2_posts RIGHT JOIN

 (SELECT tmp_taxid.tetaxid, tmp_taxid.termid, tmp_taxid.slg AS slg,

 wp_2_term_relationships.object_id AS oid

 FROM wp_2_term_relationships RIGHT JOIN

 (SELECT wp_2_term_taxonomy.term_taxonomy_id AS tetaxid, 
 
 wp_2_term_taxonomy.term_id AS termid,
 
 tmp_cate.slug AS slg
 
 FROM wp_2_term_taxonomy
 
 RIGHT JOIN (SELECT term_id, slug FROM wp_2_terms where slug='cate-a') AS tmp_cate
 
 on wp_2_term_taxonomy.term_id = tmp_cate.term_id) AS tmp_taxid

 on wp_2_term_relationships.term_taxonomy_id = tmp_taxid.tetaxid) AS tmp_last

 on wp_2_posts.ID = tmp_last.oid
