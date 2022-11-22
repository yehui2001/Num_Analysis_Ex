function Romberg
    format long;
    a = 0;
    b = 1;
    epsilon = 1e-20;
    tol = epsilon;
    fun = @(x)(1 / (1 + x^2));
    k = 0;
    n = 1;
    h = b - a;
    T = h / 2 * (fun(a) + fun(b));
    err = 1;

    while err >= tol
        k = k + 1;
        h = h / 2;
        tmp = 0;

        for i = 1:n
            tmp = tmp + fun(a + (2 * i - 1) * h);
        end

        T(k + 1, 1) = T(k) / 2 + h * tmp;

        for j = 1:k
            T(k + 1, j + 1) = T(k + 1, j) + (T(k + 1, j) - T(k, j)) / (4^j - 1);
        end

        n = n * 2;
        err = abs(T(k + 1, k + 1) - T(k, k));
    end
    T
    R = T(k + 1, k + 1);
    R = R * 4
end
