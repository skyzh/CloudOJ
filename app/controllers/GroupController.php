<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class GroupController extends CRUDController {
    protected $title = "Group";
    protected $objName = "Group";
    protected $objURI = "group";

    protected function getObjects() {
        return Group::find();
    }
    protected function findObject($objID) {
        return Group::findGroupByID($objID);;
    }
    protected function getForm($entity, $options) {
        return new GroupForm($entity, $options);
    }
    protected function newObject() {
        $group = new Group;
        $group->gid = 0;
        return $group;
    }
}
