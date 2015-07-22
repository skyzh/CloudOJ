<?php
function getPage($__start_page, $__end_page, $__all_page) {
    if($__start_page <= 0) {
        $__end_page += -$__start_page + 1;
        $__start_page = 1;
    }
    if($__end_page > $__all_page) {
        $__start_page -= $__end_page - $__all_page;
        $__end_page = $__all_page;
    }
    if($__start_page <= 0) {
        $__start_page = 1;
    }
    return array($__start_page, $__end_page);
}
?>
