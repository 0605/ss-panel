{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            �û�����
            <small>User Center</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- START PROGRESS BARS -->
        <div class="row">
            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-bullhorn"></i>

                        <h3 class="box-title">����&FAQ</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">                      
                       <!--<p>��վ�ڵ�֧�ֻ���Э�飬������ʹ��֧�ֻ����Ŀͻ��ˣ��ֻ�����ѡ�����ģʽ��</p>-->
                       {$msg}
                       <p><small>Windows�ͻ������أ�<a href="http://any.mokoo.xyz/app/ShadowsocksR-win.zip">ShadowsocksR for Windows</a></small></p>
                       <p><small>Android�ͻ������أ�<a href="https://github.com/shadowsocks/shadowsocks-android/releases/latest">Shadowsocks for Android</a></small></p>
                       <p><small>IOS�ͻ������أ�&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://itunes.apple.com/cn/app/shadowrocket/id932747118">Shadowrocket for IOS</a></small></p>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->

            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-exchange"></i>

                        <h3 class="box-title">����ʹ�����</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100"
                                         style="width: {$user->trafficUsagePercent()}%">
                                        <span class="sr-only">Transfer</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <dl class="dl-horizontal">
                            <dt>������</dt>
                            <dd>{$user->enableTraffic()}</dd>
                            <dt>��������</dt>
                            <dd>{$user->usedTraffic()}</dd>
                            <dt>ʣ������</dt>
                            <dd>{$user->unusedTraffic()}</dd>
                        </dl>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (left) -->

            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa fa-pencil"></i>

                        <h3 class="box-title">ǩ����ȡ����</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <p> ÿ{$config['checkinTime']}Сʱ����ǩ��һ�Ρ�</p>

                        <p>�ϴ�ǩ��ʱ�䣺<code>{$user->lastCheckInTime()}</code></p>
                        {if $user->isAbleToCheckin() }
                            <p id="checkin-btn">
                                <button id="checkin" class="btn btn-success  btn-flat">ǩ��</button>
                            </p>
                        {else}
                            <p><a class="btn btn-success btn-flat disabled" href="#">����ǩ��</a></p>
                        {/if}
                        <p id="checkin-msg"></p>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->

            <div class="col-md-6">
                <div class="box box-primary">
                    <div class="box-header">
                        <i class="fa  fa-paper-plane"></i>

                        <h3 class="box-title">������Ϣ</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <dl class="dl-horizontal">
                            <dt>�˿�</dt>
                            <dd>{$user->port}</dd>
                            <dt>����</dt>
                            <dd>{$user->passwd}</dd>
                            <dt>Э����</dt>
                            <dd>{$user->protocol}</dd>
                            <dt>�������</dt>
                            <dd>{$user->obfs}</dd>
                            <dt>���ܷ�ʽ</dt>
                            <dd>{$user->method}</dd>
                            <dt>�ϴ�ʹ��</dt>
                            <dd>{$user->lastSsTime()}</dd>
                        </dl>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- /.col (right) -->
        </div>
        <!-- /.row --><!-- END PROGRESS BARS -->
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->

<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                },
                error: function (jqXHR) {
                    alert("��������" + jqXHR.status);
                }
            })
        })
    })
</script>


{include file='user/footer.tpl'}
