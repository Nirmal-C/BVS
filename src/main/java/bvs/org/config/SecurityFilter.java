package bvs.org.config;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        System.out.println(uri);

        if (uri.endsWith("/changepw")) {
            if (req.getSession().getAttribute("changepw") == null) {
                resp.sendRedirect("bvsAdmin-Login");
                return;
            }
        }

        if (uri.endsWith("/Admincontrol")) {
            if (req.getSession().getAttribute("uid") == null) {
                resp.sendRedirect("bvsAdmin-Login");
                return;
            }
        }

        // Continue with the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }

}
