package fr.ippon;

import javax.jcr.RepositoryException;
import org.jahia.bin.Action;
import org.jahia.bin.ActionResult;
import org.jahia.bin.Render;
import org.jahia.services.content.JCRCallback;
import org.jahia.services.content.JCRNodeWrapper;
import org.jahia.services.content.JCRSessionWrapper;
import org.jahia.services.content.JCRTemplate;
import org.jahia.services.render.RenderContext;
import org.jahia.services.render.Resource;
import org.jahia.services.render.URLResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class AddAccount extends Action {

    private JCRTemplate jcrTemplate;

    public void setJcrTemplate(JCRTemplate jcrTemplate) {
        this.jcrTemplate = jcrTemplate;
    }

    @Override
    public ActionResult doExecute(HttpServletRequest req, RenderContext renderContext, final Resource resource, JCRSessionWrapper session, final Map<String, List<String>> parameters, URLResolver urlResolver) throws Exception {

        return (ActionResult) jcrTemplate.doExecuteWithSystemSession(null,session.getWorkspace().getName(),session.getLocale(),new JCRCallback<Object>() {
            public Object doInJCR(JCRSessionWrapper session) throws RepositoryException {
                // Parent node for the accounts
                JCRNodeWrapper node = session.getNode("/sites/strava-site/contents/accounts");

                // Get parameters from the form
                String lastname = parameters.get("lastname").get(0).toString();
                String firstname = parameters.get("firstname").get(0).toString();

                // Create node
                String nodeTitle = lastname + "-" + firstname;
                JCRNodeWrapper jcrNodeWrapper = node.addNode(nodeTitle, "jnt:account");
                jcrNodeWrapper.setProperty("lastname", lastname);
                jcrNodeWrapper.setProperty("firstname", firstname);

                // Save
                session.save();

                try {
                    return new ActionResult(HttpServletResponse.SC_OK, "/sites/strava-site/accounts");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        });
    }

}