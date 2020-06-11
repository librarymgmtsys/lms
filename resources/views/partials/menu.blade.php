<aside class="main-sidebar sidebar-dark-primary elevation-4" style="min-height: 917px;">
    <!-- Brand Logo -->
    <a href="#" class="brand-link text-center">
        <span class="brand-text text-center font-weight-light">LMS</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <li class="nav-item">
                    <a href="{{ route("admin.home") }}" class="nav-link">
                        <p>
                            <i class="fas fa-tachometer-alt">

                            </i>
                            <span>{{ trans('global.dashboard') }}</span>
                        </p>
                    </a>
                </li>
                {{-- @can('product_access')
                <li class="nav-item">
                    <a href="{{ route("admin.products.index") }}"
                class="nav-link
                {{ request()->is('admin/products') || request()->is('admin/products/*') ? 'active' : '' }}">
                <i class="fas fa-cogs">

                </i>
                <p>
                    <span>{{ trans('global.product.title') }}</span>
                </p>
                </a>
                </li>
                @endcan --}}
                @can('books_management')
                <li
                    class="nav-item has-treeview">
                    <a class="nav-link nav-dropdown-toggle">
                        <i class="fas fa-book">

                        </i>
                        <p>
                            <span>{{ trans('global.bookManagement.title') }}</span>
                            <i class="right fa fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('books_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.index") }}"
                                class="nav-link {{ request()->is('admin/books') || request()->is('admin/books/*') ? 'active' : '' }}">
                                <i class="fas fa-book"></i>
                                <p>
                                    <span>{{ trans('global.books.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('books_issue')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.issueBook") }}"
                                class="nav-link {{ request()->is('admin/books/issuebook') ? 'active' : '' }}">
                                <i class="fas fa-arrow-right "></i>
                                <p>
                                    <span>{{ trans('global.books.issue_book') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('books_receive')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.receiveBook") }}"
                                class="nav-link {{ request()->is('admin/books/receivebook') ? 'active' : '' }}">
                                <i class="fas fa-arrow-left"></i>
                                <p>
                                    <span>{{ trans('global.books.receive_book') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                    </ul>
                </li>
                @endcan
                <li
                    class="nav-item has-treeview">
                    <a class="nav-link nav-dropdown-toggle">
                        <i class="fas fa-book">

                        </i>
                        <p>
                            <span>{{ trans('global.books_management.title') }}</span>
                            <i class="right fa fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('my_books')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.myBooks") }}"
                                class="nav-link {{ request()->is('admin/books/myBooks') ? 'active' : '' }}">
                                <i class="fas fa-book"></i>
                                <p>
                                    <span>{{ trans('global.books_management.my_books') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('submit_today')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.submitToday") }}"
                            class="nav-link {{ request()->is('admin/books/submitToday') ? 'active' : '' }}">
                            <i class="fas fa-arrow-right "></i>
                                <p>
                                    <span>{{ trans('global.books_management.submit_today') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('under_fine')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.underFine") }}"
                            class="nav-link {{ request()->is('admin/books/underFine') ? 'active' : '' }}">
                            <i class="fas fa-arrow-up"></i>
                                <p>
                                    <span>{{ trans('global.books_management.under_fine') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan

                        @can('my_fine')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.myFine") }}"
                            class="nav-link {{ request()->is('admin/books/myFine') ? 'active' : '' }}">
                            <i class="fas fa-arrow-up"></i>
                                <p>
                                    <span>{{ trans('global.books_management.my_fine') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan

                        @can('available_books')
                        <li class="nav-item">
                            <a href="{{ route("admin.books.availableBooks") }}"
                            class="nav-link {{ request()->is('admin/books/available_books') ? 'active' : '' }}">
                            <i class="fas fa-asterisk"></i>
                                <p>
                                    <span>{{ trans('global.books_management.available_books') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                    </ul>
                </li>

                @can('fines_access')
                <li class="nav-item">
                    <a href="{{ route("admin.fines.index") }}"
                        class="nav-link {{ request()->is('admin/fines') || request()->is('admin/fines/*') ? 'active' : '' }}">
                        <i class="fas fa-credit-card"></i>
                        <p>
                            <span>{{ trans('global.fines.title') }}</span>
                        </p>
                    </a>
                </li>
                @endcan

                @can('announcement_access')
                <li class="nav-item">
                    <a href="{{ route("admin.announcements.index") }}"
                        class="nav-link {{ request()->is('admin/announcements') || request()->is('admin/announcements/*') ? 'active' : '' }}">
                        <i class="fas fa-bullhorn"></i>
                        <p>
                            <span>{{ trans('global.announcements.title') }}</span>
                        </p>
                    </a>
                </li>
                @endcan
                @can('category_access')
                <li class="nav-item">
                    <a href="{{ route("admin.categories.index") }}"
                        class="nav-link {{ request()->is('admin/categories') || request()->is('admin/categories/*') ? 'active' : '' }}">
                        <i class="fas fa-list-alt">

                        </i>
                        <p>
                            <span>{{ trans('global.categories.title') }}</span>
                        </p>
                    </a>
                </li>
                @endcan

                @can('language_access')
                <li class="nav-item">
                    <a href="{{ route("admin.language.index") }}"
                        class="nav-link {{ request()->is('admin/language') || request()->is('admin/language/*') ? 'active' : '' }}">
                        <i class="fas fa-language">

                        </i>
                        <p>
                            <span>{{ trans('global.language.title') }}</span>
                        </p>
                    </a>
                </li>
                @endcan
                @can('user_management_access')
                <li
                    class="nav-item has-treeview {{ request()->is('admin/permissions*') ? 'menu-open' : '' }} {{ request()->is('admin/roles*') ? 'menu-open' : '' }} {{ request()->is('admin/users*') ? 'menu-open' : '' }}">
                    <a class="nav-link nav-dropdown-toggle">
                        <i class="fas fa-users">

                        </i>
                        <p>
                            <span>{{ trans('global.userManagement.title') }}</span>
                            <i class="right fa fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @can('permission_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.permissions.index") }}"
                                class="nav-link {{ request()->is('admin/permissions') || request()->is('admin/permissions/*') ? 'active' : '' }}">
                                <i class="fas fa-unlock-alt">

                                </i>
                                <p>
                                    <span>{{ trans('global.permission.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('role_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.roles.index") }}"
                                class="nav-link {{ request()->is('admin/roles') || request()->is('admin/roles/*') ? 'active' : '' }}">
                                <i class="fas fa-briefcase">

                                </i>
                                <p>
                                    <span>{{ trans('global.role.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                        @can('user_access')
                        <li class="nav-item">
                            <a href="{{ route("admin.users.index") }}"
                                class="nav-link {{ request()->is('admin/users') || request()->is('admin/users/*') ? 'active' : '' }}">
                                <i class="fas fa-user">

                                </i>
                                <p>
                                    <span>{{ trans('global.user.title') }}</span>
                                </p>
                            </a>
                        </li>
                        @endcan
                    </ul>
                </li>
                @endcan

                <li class="nav-item">
                    <a href="#" class="nav-link"
                        onclick="event.preventDefault(); document.getElementById('logoutform').submit();">
                        <p>
                            <i class="fas fa-sign-out-alt">

                            </i>
                            <span>{{ trans('global.logout') }}</span>
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
