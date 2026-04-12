
-- Allow anonymous reads for slug checking (seeding)
DROP POLICY IF EXISTS "Anyone can read published blog posts" ON public.blog_posts;
CREATE POLICY "Anyone can read blog posts"
ON public.blog_posts FOR SELECT
USING (true);

-- Seed default blog posts
INSERT INTO public.blog_posts (title, excerpt, content, author, publish_date, status, image, slug, tags, seo_title, seo_description) VALUES
(
  'Veille impots.cm : dernières publications fiscales',
  'Consultez rapidement les derniers documents, actualités et notes publiés sur impots.cm.',
  '<h2>Dernières parutions de impots.cm</h2><p>Cet article de veille vous permet d''accéder directement aux informations les plus récentes publiées par la Direction Générale des Impôts du Cameroun.</p><div class="bg-gray-50"><h3>Accès rapide</h3><ul><li><a href="https://www.impots.cm/" target="_blank" rel="noopener noreferrer">Page d''accueil impots.cm</a></li><li><a href="https://www.impots.cm/fr/actualites" target="_blank" rel="noopener noreferrer">Rubrique actualités</a></li><li><a href="https://www.impots.cm/fr/documentations" target="_blank" rel="noopener noreferrer">Rubrique documents</a></li></ul></div><p>Astuce: ouvrez les rubriques ci-dessus pour identifier immédiatement la dernière publication.</p>',
  'PRISMA GESTION',
  '2026-04-10',
  'Publié',
  '/blog-images/veille-impots.jpg',
  'veille-impots-cm-dernieres-publications',
  ARRAY['Veille réglementaire', 'Fiscalité'],
  'Veille impots.cm : dernières publications fiscales',
  'Suivez les dernières publications, actualités et documents publiés sur impots.cm.'
),
(
  'Veille cnps.cm : dernières actualités sociales',
  'Retrouvez le dernier élément publié sur cnps.cm : communiqué, document ou news officielle.',
  '<h2>Dernières parutions de cnps.cm</h2><p>Cette veille centralise l''accès aux contenus récents diffusés par la CNPS.</p><div class="bg-gray-50"><h3>Accès rapide</h3><ul><li><a href="https://www.cnps.cm/" target="_blank" rel="noopener noreferrer">Page d''accueil cnps.cm</a></li><li><a href="https://www.cnps.cm/actualites/" target="_blank" rel="noopener noreferrer">Rubrique actualités</a></li><li><a href="https://www.cnps.cm/documentation/" target="_blank" rel="noopener noreferrer">Rubrique documentation</a></li></ul></div><p>Vérifiez ces sections pour consulter la publication la plus récente.</p>',
  'PRISMA GESTION',
  '2026-04-10',
  'Publié',
  '/blog-images/veille-cnps.jpg',
  'veille-cnps-cm-dernieres-actualites',
  ARRAY['Veille réglementaire', 'Social'],
  'Veille cnps.cm : dernières actualités sociales',
  'Accédez rapidement aux dernières actualités et documents publiés sur cnps.cm.'
),
(
  'Veille egecam.cm : nouveaux documents et annonces',
  'Un point d''accès direct vers la dernière publication visible sur egecam.cm.',
  '<h2>Dernières parutions de egecam.cm</h2><p>Utilisez cette page pour accéder en un clic aux nouveautés publiées par EGECAM.</p><div class="bg-gray-50"><h3>Accès rapide</h3><ul><li><a href="https://egecam.cm/" target="_blank" rel="noopener noreferrer">Page d''accueil egecam.cm</a></li><li><a href="https://egecam.cm/category/actualites/" target="_blank" rel="noopener noreferrer">Rubrique actualités</a></li><li><a href="https://egecam.cm/category/documents/" target="_blank" rel="noopener noreferrer">Rubrique documents</a></li></ul></div><p>Consultez ces sections pour repérer le dernier contenu publié.</p>',
  'PRISMA GESTION',
  '2026-04-10',
  'Publié',
  '/blog-images/veille-egecam.jpg',
  'veille-egecam-cm-documents-annonces',
  ARRAY['Veille', 'Institutionnel'],
  'Veille egecam.cm : nouveaux documents et annonces',
  'Suivi des dernières publications de egecam.cm (documents, actualités, annonces).'
),
(
  'Veille DGICAM Facebook : dernière publication',
  'Suivez la dernière publication postée sur la page Facebook officielle DGICAM.',
  '<h2>Dernières parutions Facebook DGICAM</h2><p>Cette veille pointe vers la page officielle DGICAM pour consulter le dernier post publié.</p><div class="bg-gray-50"><h3>Lien direct</h3><ul><li><a href="https://www.facebook.com/DGICAM" target="_blank" rel="noopener noreferrer">Page Facebook DGICAM</a></li></ul></div><p>Le premier post affiché en haut du fil correspond généralement à la publication la plus récente.</p>',
  'PRISMA GESTION',
  '2026-04-10',
  'Publié',
  '/blog-images/veille-dgicam.jpg',
  'veille-facebook-dgicam-derniere-publication',
  ARRAY['Veille', 'Réseaux sociaux'],
  'Veille DGICAM Facebook : dernière publication',
  'Accès rapide à la dernière publication de la page Facebook DGICAM.'
),
(
  'Les avantages de la comptabilité en ligne',
  'Pourquoi passer à la comptabilité informatisée en 2025.',
  '',
  'Nathan OBIANG TIME',
  '2026-04-11',
  'Publié',
  '/lovable-uploads/85999c6b-953e-4905-b204-fec3dfc4e72f.png',
  'avantages-comptabilite-en-ligne',
  ARRAY['Comptabilité'],
  'Les avantages de la comptabilité en ligne en 2025',
  'Découvrez pourquoi passer à la comptabilité informatisée en 2025 peut transformer votre entreprise.'
),
(
  'Les nouvelles normes fiscales et comptables pour 2025',
  'Lois des finances 2025, ce que vous devez savoir.',
  '',
  'Nathan OBIANG TIME',
  '2026-04-11',
  'Publié',
  '/lovable-uploads/4d9dc424-4eb4-4aca-aba9-e462d333f67c.png',
  'nouvelles-normes-fiscales-2025',
  ARRAY['Fiscalité'],
  'Nouvelles normes fiscales et comptables 2025',
  'Tout ce que vous devez savoir sur la loi de finances 2025 et les nouvelles obligations fiscales.'
),
(
  'Impôt Général Synthétique (IGS)',
  'IGS, ce qui change.',
  '',
  'Nathan OBIANG TIME',
  '2026-04-11',
  'Publié',
  '/lovable-uploads/a9b4950e-4e9a-4b2d-89ed-55266f59fd49.png',
  'impot-general-synthetique-igs',
  ARRAY['Fiscalité'],
  'Impôt Général Synthétique (IGS) : Ce qui change',
  'Découvrez l''Impôt Général Synthétique (IGS), comment il fonctionne et ce qui change pour les entreprises.'
)
ON CONFLICT (slug) DO NOTHING;
