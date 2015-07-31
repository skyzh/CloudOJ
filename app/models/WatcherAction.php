<?php
class WatcherAction {
    public static function SubmitProblem($uid, $pid) {
        $user = User::findUserByID($uid);
        $user->userprofile->submit++;
        $user->save();

        $prob = Problemset::findProblemByID($pid);
        $prob->submit++;
        $prob->save();
    }
    public static function AcceptProblem($uid, $pid) {
        $user = User::findUserByID($uid);
        $user->userprofile->accepted++;
        $user->save();

        $prob = Problemset::findProblemByID($pid);
        $prob->accepted++;
        $prob->save();
    }

}
