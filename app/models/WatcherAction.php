<?php
class WatcherAction {
    public static function SubmitProblem($uid, $pid) {
        $user = User::findUserByID($uid);
        $user->userprofile->submit++;
        $user->userprofile->score += 1;
        $user->save();

        $prob = Problemset::findProblemByID($pid);
        $prob->submit++;
        $prob->save();
    }
    public static function AcceptProblem($uid, $pid) {
        $user = User::findUserByID($uid);
        $user->userprofile->accepted++;
        $user->userprofile->score += 5;
        $user->save();

        $prob = Problemset::findProblemByID($pid);
        $prob->accepted++;
        $prob->save();
    }

}
