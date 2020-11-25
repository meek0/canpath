<!-- Custom js -->
<script>
  $(function () {
    // set moment's locale
    moment.locale('${.lang}');
    $('.moment-date2').each(function () {
      var msg = $.trim($(this).html());
      if (msg && msg.length > 0) {
          msg = moment(msg, 'DD-MM-YYYY').format('LL');
          $(this).html(msg);
      }
    });
    $('a.brand-link').removeClass('bg-white').addClass('bg-navy');
    $('#search-page aside.sidebar-dark-primary').removeClass('sidebar-dark-primary').addClass('sidebar-light-primary');

    // searchinfo cookie to hide for ever the search-info alert once closed
    const searchInfoCookie = 'searchinfo';
    $('#search-info').on('closed.bs.alert', function () {
        document.cookie = searchInfoCookie + '=1';
    });
    function getCookieValue(name) {
        let result = document.cookie.match("(^|[^;]+)\\s*" + name + "\\s*=\\s*([^;]+)")
        return result ? result.pop() : ""
    }
    const searchInfoValue = getCookieValue(searchInfoCookie);
    if (searchInfoValue === '1') {
        $('#search-info').hide();
    } else {
        $('#search-info').show();
    }
  });
</script>
<script src="/assets/js/custom.js"></script>
