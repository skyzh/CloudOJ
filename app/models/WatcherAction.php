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
        $user->userprofile->score += 4;
        $user->save();

        $prob = Problemset::findProblemByID($pid);
        $prob->accepted++;
        $prob->save();
    }
    public static function ContributeProblem($uid, $pid) {
        $user = User::findUserByID($uid);
        $user->userprofile->score += 2;
        $user->save();

        $prob = Problemset::findProblemByID($pid);
        $contributors = explode(',', $prob->problemdetail->contributors);
        array_push($contributors, strval($uid));
        $contributors = array_unique($contributors);
        $prob->problemdetail->contributors = join(',', $contributors);
        $prob->save();
    }
}
