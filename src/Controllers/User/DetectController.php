<?php

declare(strict_types=1);

namespace App\Controllers\User;

use App\Controllers\BaseController;
use App\Models\DetectLog;
use App\Models\DetectRule;
use App\Utils\Tools;
use Slim\Http\Response;
use Slim\Http\ServerRequest;

final class DetectController extends BaseController
{
    /**
     * @param array     $args
     */
    public function index(ServerRequest $request, Response $response, array $args)
    {
        $pageNum = $request->getQueryParams()['page'] ?? 1;
        $logs = DetectRule::paginate(15, ['*'], 'page', $pageNum);

        if ($request->getParam('json') === 1) {
            return $response->withJson([
                'ret' => 1,
                'logs' => $logs,
            ]);
        }

        $render = Tools::paginateRender($logs);
        return $response->write($this->view()
            ->assign('rules', $logs)
            ->assign('render', $render)
            ->fetch('user/detect/index.tpl'));
    }

    /**
     * @param array     $args
     */
    public function log(ServerRequest $request, Response $response, array $args)
    {
        $pageNum = $request->getQueryParams()['page'] ?? 1;
        $logs = DetectLog::orderBy('id', 'desc')->where('user_id', $this->user->id)->paginate(15, ['*'], 'page', $pageNum);

        if ($request->getParam('json') === 1) {
            foreach ($logs as $log) {
                /** @var DetectLog $log */
                if ($log->node() === null) {
                    DetectLog::nodeIsNull($log);
                    continue;
                }
                if ($log->rule() === null) {
                    DetectLog::ruleIsNull($log);
                    continue;
                }
                $log->node_name = $log->nodeName();
                $log->detect_rule_name = $log->ruleName();
                $log->detect_rule_text = $log->ruleText();
                $log->detect_rule_regex = $log->ruleRegex();
                $log->detect_rule_type = $log->ruleType();
                $log->detect_rule_date = $log->datetime();
            }
            return $response->withJson([
                'ret' => 1,
                'logs' => $logs,
            ]);
        }

        $render = Tools::paginateRender($logs);
        return $response->write($this->view()
            ->assign('logs', $logs)
            ->assign('render', $render)
            ->fetch('user/detect/log.tpl'));
    }
}
