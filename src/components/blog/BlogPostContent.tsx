
import React from "react";
import DOMPurify from "dompurify";

interface BlogPostContentProps {
  content: string;
}

const BlogPostContent: React.FC<BlogPostContentProps> = ({ content }) => {
  if (!content) {
    return null;
  }

  // Préprocesser les liens pour qu'ils s'ouvrent correctement
  // et ajuster les liens internes pour utiliser React Router
  const processedContent = content.replace(
    /<a\s+href="([^"]+)"([^>]*)>/g, 
    (match, url, attrs) => {
      // Ajouter target="_blank" et rel="noopener noreferrer" pour les liens externes
      if (url.startsWith('http')) {
        return `<a href="${url}" target="_blank" rel="noopener noreferrer"${attrs}>`;
      }
      // Pour les liens internes (qui commencent par /) et qui pourraient être des liens de blog
      else if (url.startsWith('/blog/')) {
        // On ne modifie pas directement le HTML car React Router a besoin de gérer le clic
        // On ajoute simplement une classe pour les identifier
        return `<a href="${url}" class="internal-link"${attrs}>`;
      }
      return match;
    }
  );

  // Assainir le contenu pour éviter les failles XSS
  const sanitizedContent = DOMPurify.sanitize(processedContent, {
    ADD_ATTR: ['target', 'rel', 'class'], // Permettre les attributs ajoutés pour les liens
  });

  // Ajouter un script pour gérer les clics sur les liens internes
  // Ce script sera exécuté après le rendu initial du contenu
  React.useEffect(() => {
    const handleInternalLinks = () => {
      const internalLinks = document.querySelectorAll('.internal-link');
      internalLinks.forEach(link => {
        link.addEventListener('click', (e) => {
          e.preventDefault();
          const href = (link as HTMLAnchorElement).getAttribute('href');
          if (href) {
            window.history.pushState({}, '', href);
            // Déclencher une navigation manuellement
            const navEvent = new PopStateEvent('popstate');
            window.dispatchEvent(navEvent);
          }
        });
      });
    };
    
    // Exécuter après que le contenu a été rendu
    setTimeout(handleInternalLinks, 100);
    
    // Cleanup
    return () => {
      const internalLinks = document.querySelectorAll('.internal-link');
      internalLinks.forEach(link => {
        link.removeEventListener('click', () => {});
      });
    };
  }, [content]);

  return (
    <div className="w-full max-w-none">
      <div 
        dangerouslySetInnerHTML={{ __html: sanitizedContent }}
        className="prose prose-lg max-w-none px-4 sm:px-6 md:px-8 py-6
          [&>h2]:text-2xl [&>h2]:font-heading [&>h2]:font-bold [&>h2]:text-prisma-purple [&>h2]:mt-8 [&>h2]:mb-4 [&>h2]:border-b [&>h2]:pb-2
          [&>h3]:text-xl [&>h3]:font-heading [&>h3]:font-semibold [&>h3]:text-prisma-purple/90 [&>h3]:mt-6 [&>h3]:mb-3
          [&>p]:text-gray-700 [&>p]:leading-relaxed [&>p]:mb-4
          [&>ul]:list-disc [&>ul]:pl-6 [&>ul]:text-gray-700 [&>ul]:space-y-2 [&>ul]:mb-4
          [&>ol]:list-decimal [&>ol]:pl-6 [&>ol]:text-gray-700 [&>ol]:space-y-2 [&>ol]:mb-4
          [&>blockquote]:border-l-4 [&>blockquote]:border-gray-300 [&>blockquote]:pl-4 [&>blockquote]:italic [&>blockquote]:text-gray-600 [&>blockquote]:my-6
          [&>a]:text-blue-600 [&>a]:underline [&>a]:hover:text-blue-800
          [&_a]:text-blue-600 [&_a]:underline [&_a]:hover:text-blue-800
          [&_a]:cursor-pointer
          [&>img]:max-w-full [&>img]:rounded-lg [&>img]:my-6 [&>img]:shadow-md
          [&_img]:max-w-full [&_img]:rounded-lg [&_img]:my-6 [&_img]:shadow-md
          [&>.bg-gray-50]:p-6 [&>.bg-gray-50]:rounded-lg [&>.bg-gray-50]:my-6 [&>.bg-gray-50]:shadow-sm"
      />
    </div>
  );
};

export default BlogPostContent;
