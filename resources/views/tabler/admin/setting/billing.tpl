{include file='admin/tabler_header.tpl'}

<div class="page-wrapper">
    <div class="container-xl">
        <div class="page-header d-print-none text-white">
            <div class="row align-items-center">
                <div class="col">
                    <h2 class="page-title">
                        <span class="home-title">财务设置</span>
                    </h2>
                    <div class="page-pretitle my-3">
                        <span class="home-subtitle">设置站点的财务系统</span>
                    </div>
                </div>
                <div class="col-auto ms-auto d-print-none">
                    <div class="btn-list">
                        <a id="save-setting" href="#" class="btn btn-primary">
                            <i class="icon ti ti-device-floppy"></i>
                            保存
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="page-body">
        <div class="container-xl">
            <div class="row row-deck row-cards">
                <div class="col-md-12">
                    <div class="card">
                    <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs" data-bs-toggle="tabs">
                        <li class="nav-item">
                            <a href="#gateway" class="nav-link active" data-bs-toggle="tab">网关选择</a>
                        </li>
                        <li class="nav-item">
                            <a href="#f2f" class="nav-link" data-bs-toggle="tab">支付宝当面付</a>
                        </li>
                        <li class="nav-item">
                            <a href="#vmq" class="nav-link" data-bs-toggle="tab">V免签</a>
                        </li>
                        <li class="nav-item">
                            <a href="#payjs" class="nav-link" data-bs-toggle="tab">PayJS</a>
                        </li>
                        <li class="nav-item">
                            <a href="#theadpay" class="nav-link" data-bs-toggle="tab">TheadPay</a>
                        </li>
                        <li class="nav-item">
                            <a href="#paymentwall" class="nav-link" data-bs-toggle="tab">Paymentwall</a>
                        </li>
                        <li class="nav-item">
                            <a href="#stripe" class="nav-link" data-bs-toggle="tab">Stripe</a>
                        </li>
                        <li class="nav-item">
                            <a href="#epay" class="nav-link" data-bs-toggle="tab">EPay</a>
                        </li>
                    </ul>
                </div>
                <div class="card-body">
                    <div class="tab-content">
                        <div class="tab-pane active show" id="gateway">
                            {foreach $payment_gateways as $key => $value}
                            <div class="form-group mb-3 row">
                                <div class="row align-items-center">
                                    <label class="form-label col-3 col-form-label">{$key}</label>
                                    <label class="col-auto ms-auto form-check form-check-single form-switch">
                                        <input id="{$value}_enable" class="form-check-input" type="checkbox"
                                        {if in_array($value, $active_payment_gateway)}checked="" {/if}>
                                    </label>
                                </div>
                            </div>
                            {/foreach}
                        </div>
                        <div class="tab-pane" id="f2f">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">App ID</label>
                                    <div class="col">
                                        <input id="f2f_pay_app_id" type="text" class="form-control" value="{$settings['f2f_pay_app_id']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">PID</label>
                                    <div class="col">
                                        <input id="f2f_pay_pid" type="text" class="form-control" value="{$settings['f2f_pay_pid']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">公钥</label>
                                    <div class="col">
                                        <input id="f2f_pay_public_key" type="text" class="form-control" value="{$settings['f2f_pay_public_key']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">私钥</label>
                                    <div class="col">
                                        <input id="f2f_pay_private_key" type="text" class="form-control" value="{$settings['f2f_pay_private_key']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">自定义回调地址（可选）</label>
                                    <div class="col">
                                        <input id="f2f_pay_notify_url" type="text" class="form-control" value="{$settings['f2f_pay_notify_url']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="vmq">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">网关地址</label>
                                    <div class="col">
                                        <input id="vmq_gateway" type="text" class="form-control" value="{$settings['vmq_gateway']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">密钥</label>
                                    <div class="col">
                                        <input id="vmq_key" type="text" class="form-control" value="{$settings['vmq_key']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="payjs">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">网关地址</label>
                                    <div class="col">
                                        <input id="payjs_url" type="text" class="form-control" value="{$settings['payjs_url']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">商户ID</label>
                                    <div class="col">
                                        <input id="payjs_mchid" type="text" class="form-control" value="{$settings['payjs_mchid']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">密钥</label>
                                    <div class="col">
                                        <input id="payjs_key" type="text" class="form-control" value="{$settings['payjs_key']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="theadpay">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">网关地址</label>
                                    <div class="col">
                                        <input id="theadpay_url" type="text" class="form-control" value="{$settings['theadpay_url']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">商户ID</label>
                                    <div class="col">
                                        <input id="theadpay_mchid" type="text" class="form-control" value="{$settings['theadpay_mchid']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">密钥</label>
                                    <div class="col">
                                        <input id="theadpay_key" type="text" class="form-control" value="{$settings['theadpay_key']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="paymentwall">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">公钥</label>
                                    <div class="col">
                                        <input id="pmw_publickey" type="text" class="form-control" value="{$settings['pmw_publickey']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">私钥</label>
                                    <div class="col">
                                        <input id="pmw_privatekey" type="text" class="form-control" value="{$settings['pmw_privatekey']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">支付图标宽度</label>
                                    <div class="col">
                                        <input id="pmw_widget" type="text" class="form-control" value="{$settings['pmw_widget']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">支付图标高度</label>
                                    <div class="col">
                                        <input id="pmw_height" type="text" class="form-control" value="{$settings['pmw_height']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="stripe">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">银行卡支付</label>
                                    <div class="col">
                                        <select id="stripe_card" class="col form-select" value="{$settings['stripe_card']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['stripe_card'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">支付宝支付</label>
                                    <div class="col">
                                        <select id="stripe_alipay" class="col form-select" value="{$settings['stripe_alipay']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['stripe_alipay'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">微信支付</label>
                                    <div class="col">
                                        <select id="stripe_wechat" class="col form-select" value="{$settings['stripe_wechat']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['stripe_wechat'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">网关货币</label>
                                    <div class="col">
                                        <input id="stripe_currency" type="text" class="form-control" value="{$settings['stripe_currency']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">最低充值限额（整数）</label>
                                    <div class="col">
                                        <input id="stripe_min_recharge" type="text" class="form-control" value="{$settings['stripe_min_recharge']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">最高充值限额（整数）</label>
                                    <div class="col">
                                        <input id="stripe_max_recharge" type="text" class="form-control" value="{$settings['stripe_max_recharge']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">公钥</label>
                                    <div class="col">
                                        <input id="stripe_pk" type="text" class="form-control" value="{$settings['stripe_pk']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">私钥</label>
                                    <div class="col">
                                        <input id="stripe_sk" type="text" class="form-control" value="{$settings['stripe_sk']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">WebHook密钥</label>
                                    <div class="col">
                                        <input id="stripe_webhook_key" type="text" class="form-control" value="{$settings['stripe_webhook_key']}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="epay">
                            <div class="card-body">
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">网关地址</label>
                                    <div class="col">
                                        <input id="epay_url" type="text" class="form-control" value="{$settings['epay_url']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">商户ID</label>
                                    <div class="col">
                                        <input id="epay_pid" type="text" class="form-control" value="{$settings['epay_pid']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">密钥</label>
                                    <div class="col">
                                        <input id="epay_key" type="text" class="form-control" value="{$settings['epay_key']}">
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">支付宝</label>
                                    <div class="col">
                                        <select id="epay_alipay" class="col form-select" value="{$settings['epay_alipay']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['epay_alipay'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">微信支付</label>
                                    <div class="col">
                                        <select id="epay_wechat" class="col form-select" value="{$settings['epay_wechat']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['epay_wechat'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">QQ钱包</label>
                                    <div class="col">
                                        <select id="epay_qq" class="col form-select" value="{$settings['epay_qq']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['epay_qq'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group mb-3 row">
                                    <label class="form-label col-3 col-form-label">USDT</label>
                                    <div class="col">
                                        <select id="epay_usdt" class="col form-select" value="{$settings['epay_usdt']}">
                                            <option value="0">停用</option>
                                            <option value="1" {if $settings['epay_usdt'] === true}selected{/if}>启用</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#save-setting").click(function() {
        $.ajax({
            url: '/admin/setting/billing',
            type: 'POST',
            dataType: "json",
            data: {
                {foreach $update_field as $key}
                {$key}: $('#{$key}').val(),
                {/foreach}
                {foreach $payment_gateways as $key => $value}
                {$key}: $("#{$key}_enable").is(":checked"),
                {/foreach}
            },
            success: function(data) {
                if (data.ret == 1) {
                    $('#success-message').text(data.msg);
                    $('#success-dialog').modal('show');
                } else {
                    $('#fail-message').text(data.msg);
                    $('#fail-dialog').modal('show');
                }
            }
        })
    });
</script>

{include file='admin/tabler_footer.tpl'}