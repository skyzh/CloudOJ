<?php
class PublicLib {
    public static function getPage($__start_page, $__end_page, $__all_page) {
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

    public static function getPageElement($paginator, $pagecount) {
        list($startpage, $endpage) = PublicLib::getPage(
            $paginator->current - $pagecount,
            $paginator->current + $pagecount, $paginator->total_pages);
        $pg = array();
        for($page = $startpage; $page <= $endpage; $page++) {
            array_push($pg, $page);
        }
        return $pg;
    }
}
?>
