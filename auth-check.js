// auth-check.js - Simple authentication check for GRAVLOC
(function() {
    // List of pages that require authentication
    const protectedPages = [
        'dashboard.html',
        'product_detail.html',
        'antennas.html',
        'login.html',
        'signup.html'
    ];
    
    // Get current page name
    const currentPage = window.location.pathname.split('/').pop();
    
    // Check if current page is protected
    if (protectedPages.includes(currentPage)) {
        // Check if user is authenticated (session storage or cookie)
        const isAuthenticated = sessionStorage.getItem('gravloc_auth') === 'true';
        
        if (!isAuthenticated) {
            // Redirect to home page
            window.location.href = '/';
        }
    }
})();