@extends('layouts.admin')
@section('content')
<div class="content">
    <div class="row">
        @can('reports_all_books')
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner">
                    <h3>{{$reports_all_books}}</h3>
                    <p>{{ trans('global.admin_dash.reports_all_books') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('reports_current_issued')
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>{{$reports_current_issued}}</h3>
                    <p>{{ trans('global.admin_dash.reports_current_issued') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('reports_total_issued')

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>{{$reports_total_issued}}</h3>
                    <p>{{ trans('global.admin_dash.reports_total_issued') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>

            </div>
        </div>
        @endcan

        @can('reports_total_fine_received')

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
                <div class="inner">
                    <h3>{{$reports_total_fine_received}}</h3>
                    <p>{{ trans('global.admin_dash.reports_total_fine_received') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('reports_total_fine_pending')
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner">
                    <h3>{{$reports_total_fine_pending}}</h3>
                    <p>{{ trans('global.admin_dash.reports_total_fine_pending') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('reports_today_receive_books')
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>{{$reports_today_receive_books}}</h3>
                    <p>{{ trans('global.admin_dash.reports_today_receive_books') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>

            </div>
        </div>
        @endcan
        <!-- ./col -->
    </div>
    <div class="row">
        @can('reports_today_receive_books')
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title"> {{ trans('global.admin_dash.reports_today_receive_books') }} </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">

                    <div class="table-responsive">
                        <table class="table m-0">
                            <thead>
                                <tr>
                                    <th>Book</th>
                                    <th>User</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($receiveBooks as $item)
                                <tr>
                                    <td>{{$item->bookId->name}}</td>
                                    <td>{{$item->userId->name}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>

        @endcan
        @can('reports_last_10_fines')
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title"> {{ trans('global.admin_dash.reports_last_10_fines') }} </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">

                    <div class="table-responsive">
                        <table class="table m-0">
                            <thead>
                                <tr>
                                    <th>Amount</th>
                                    <th>User</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($last10FinesAdmin as $item)
                                <tr>
                                    <td>{{$item->amount}}</td>
                                    <td>{{$item->userId->name}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>

        @endcan
        @can('reports_last_10_issue')

        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title"> {{ trans('global.admin_dash.reports_last_10_issue') }} </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">

                    <div class="table-responsive">
                        <table class="table m-0">
                            <thead>
                                <tr>
                                    <th>Book</th>
                                    <th>User</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($last10BooksIssuedAdmin as $item)
                                <tr>
                                    <td>{{$item->bookId->name}}</td>
                                    <td>{{$item->userId->name}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
        @endcan
        @can('reports_last_10_receive')
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title"> {{trans('global.admin_dash.reports_last_10_receive') }} </h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">

                    <div class="table-responsive">
                        <table class="table m-0">
                            <thead>
                                <tr>
                                    <th>Book</th>
                                    <th>User</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($last10BooksReceivedAdmin as $item)
                                <tr>
                                    <td>{{$item->bookId->name}}</td>
                                    <td>{{$item->userId->name}}</td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
        @endcan
    </div>

    <div class="row">
        @can('user_current_issued')
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>{{$user_current_issued}}</h3>
                    <p>{{ trans('global.user_dash.user_current_issued') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('user_total_issued')

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>{{$user_total_issued}}</h3>
                    <p>{{ trans('global.user_dash.user_total_issued') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>

            </div>
        </div>
        @endcan

        @can('user_total_fine_received')

        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
                <div class="inner">
                    <h3>{{$user_total_fine_received}}</h3>
                    <p>{{ trans('global.user_dash.user_total_fine_received') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('user_total_fine_pending')
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner">
                    <h3>{{$user_total_fine_pending}}</h3>
                    <p>{{ trans('global.user_dash.user_total_fine_pending') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>

            </div>
        </div>
        @endcan
        @can('user_today_receive_books')
        <!-- ./col -->
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>{{$user_today_receive_books}}</h3>
                    <p>{{ trans('global.user_dash.user_today_receive_books') }}</p>
                </div>
                <div class="icon">
                    <i class="ion ion-stats-bars"></i>
                </div>

            </div>
        </div>
        @endcan
        <!-- ./col -->
    </div>

</div>
@endsection
@section('scripts')
@parent

@endsection
