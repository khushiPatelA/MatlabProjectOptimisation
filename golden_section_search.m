function [xmin, fmin] = golden_section_search(f, a0, b0, l)
    gamma = (sqrt(5) + 1) / 2;
    p = b0 - (b0 - a0) / gamma;
    q = a0 + (b0 - a0) / gamma;

    while abs(b0 - a0) > l
        fp = f(p);
        fq = f(q);
        if fp < fq
            b0 = q;
            q = p;
            p = b0 - (b0 - a0) / gamma;
        else
            a0 = p;
            p = q;
            q = a0 + (b0 - a0) / gamma;
        end
    end

    xmin = (b0 + a0) / 2;
    fmin = f(xmin);
end
