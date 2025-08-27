<div class="quixnav">
    <div class="quixnav-scroll">
        <ul class="metismenu" id="menu">
            <li class="nav-label first">Main Menu</li>
            @can('dashboard')
                <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="icon icon-home"></i><span
                            class="nav-text">Dashboard</span></a>
                    <ul aria-expanded="false" class="mm-collapse {{ setSidebarActive(['dashboard', 'dashboard2']) }}">
                        @can('dashboard-one')
                            <li class="{{ setSidebarActive(['dashboard', 'dashboard2']) }}"><a
                                    class="{{ setSidebarActive(['dashboard', 'dashboard2']) }}"
                                    href="{{ route('dashboard') }}">Dashboard 1</a></li>
                        @endcan
                        <!-- @can('dashboard-two')
                            <li class="{{ setSidebarActive(['dashboard', 'dashboard2']) }}"><a
                                    class="{{ setSidebarActive(['dashboard', 'dashboard2']) }}"
                                    href="{{ route('dashboard2') }}">Dashboard 2</a></li>
                        @endcan -->
                    </ul>
                </li>
            @endcan

            @can('business-settings')
                <!-- <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                            class="icon icon-app-store"></i><span class="nav-text">Business Settings</span></a>
                    <ul aria-expanded="false"
                        class="mm-collapse {{ setSidebarActive(['creed-tags.*', 'business-type.*', 'business-category.*', 'business-subcategory.*', 'business-tags.*', 'restaurant.*', 'affiliations.*', 'pricing-plan.*', 'add-listing-form-management.*']) }}">
                        @can('creed-tags')
                            <li class="{{ setSidebarActive(['creed-tags.*']) }}"><a
                                    class="{{ setSidebarActive(['creed-tags.*']) }}"
                                    href="{{ route('creed-tags.index') }}">Creed Tags</a></li>
                        @endcan
                        @can('business-type')
                            <li class="{{ setSidebarActive(['business-type.*']) }}"><a
                                    class="{{ setSidebarActive(['business-type.*']) }}"
                                    href="{{ route('business-type.index') }}">Business Type</a></li>
                        @endcan
                        @can('business-category')
                            <li class="{{ setSidebarActive(['business-category.*']) }}"><a
                                    class="{{ setSidebarActive(['business-category.*']) }}"
                                    href="{{ route('business-category.index') }}">Business Category</a></li>
                        @endcan
                        @can('business-subcategory')
                            <li class="{{ setSidebarActive(['business-subcategory.*']) }}"><a
                                    class="{{ setSidebarActive(['business-subcategory.*']) }}"
                                    href="{{ route('business-subcategory.index') }}">Business SubCategory</a></li>
                        @endcan
                        @can('business-tags')
                            <li class="{{ setSidebarActive(['business-tags.*']) }}"><a
                                    class="{{ setSidebarActive(['business-tags.*']) }}"
                                    href="{{ route('business-tags.index') }}">Business Tags</a></li>
                        @endcan
                        @can('restaurant')
                            <li class="{{ setSidebarActive(['restaurant.*']) }}"><a
                                    class="{{ setSidebarActive(['restaurant.*']) }}"
                                    href="{{ route('restaurant.index') }}">Restaurant</a></li>
                        @endcan
                        @can('affliations')
                            <li class="{{ setSidebarActive(['affiliations.*']) }}"><a
                                    class="{{ setSidebarActive(['affiliations.*']) }}"
                                    href="{{ route('affiliations.index') }}">Affiliations</a></li>
                        @endcan
                        @can('pricing-plan')
                            <li class="{{ setSidebarActive(['pricing-plan.*']) }}"><a
                                    class="{{ setSidebarActive(['pricing-plan.*']) }}"
                                    href="{{ route('pricing-plan.index') }}">Pricing Plans</a></li>
                        @endcan
                        @can('add-listing-form-management')
                            <li class="{{ setSidebarActive(['add-listing-form-management.*']) }}"><a
                                    class="{{ setSidebarActive(['add-listing-form-management.*']) }}"
                                    href="{{ route('add-listing-form-management.index') }}">Form Management</a></li>
                        @endcan
                    </ul>
                </li> -->
            @endcan


            @can('customer')
                <!-- <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                            class="icon icon-single-04"></i><span class="nav-text">Customer Management</span></a>
                    <ul aria-expanded="false"
                        class="mm-collapse {{ setSidebarActive(['customers.list', 'customers-details.view', 'customers-profile.image', 'customers-list.edit', 'customers.archive.list', 'customers.archive.list.retrieve', 'customers.business.reviews']) }}">
                        @can('customer-list')
                            <li
                                class="{{ setSidebarActive(['customers.list', 'customers-details.view', 'customers-profile.image', 'customers-list.edit']) }}">
                                <a class="{{ setSidebarActive(['customers.list', 'customers-details.view', 'customers-profile.image', 'customers-list.edit']) }}"
                                    href="{{ route('customers.list') }}">Customers List</a>
                            </li>
                        @endcan

                        @can('business-list')
                            <li class="{{ setSidebarActive(['customers.business.list', 'customers.business.reviews']) }}">
                                <a class="{{ setSidebarActive(['customers.business.list', 'customers.business.reviews']) }}"
                                    href="{{ route('customers.business.list') }}">Business List</a>
                            </li>
                        @endcan

                        @can('archieve-list')
                            <li class="{{ setSidebarActive(['customers.archive.list', 'customers.archive.list.retrieve']) }}">
                                <a href="{{ route('customers.archive.list') }}">Archieve List</a></li>
                        @endcan
                    </ul>
                </li> -->
            @endcan

            @can('contact-creed')
                <li><a href="{{ route('deposit-list') }}" aria-expanded="false">
                        <i class="fas fa-envelope"></i><span class="nav-text">Deposit List</span></a>
                </li>
            @endcan

            @can('contact-creed')
                <li><a href="{{ route('invest-list') }}" aria-expanded="false">
                        <i class="fas fa-envelope"></i><span class="nav-text">Invest List</span></a>
                </li>
            @endcan

            @can('contact-creed')
                <li><a href="{{ route('buy-packages-list') }}" aria-expanded="false">
                        <i class="fas fa-envelope"></i><span class="nav-text">Buy Packages</span></a>
                </li>
            @endcan

            @can('user')
                <!-- <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i class="fas fa-user-tie"></i><span
                            class="nav-text">User Management</span></a>
                    <ul aria-expanded="false"
                        class="mm-collapse {{ setSidebarActive(['users.*', 'roles.*', 'permissions.*']) }}">

                        @can('admin-user')
                            <li class="{{ setSidebarActive(['users.*']) }}"><a class="{{ setSidebarActive(['users.*']) }}"
                                    href="{{ route('users.index') }}">Users</a></li>
                        @endcan

                        @can('role')
                            <li class="{{ setSidebarActive(['roles.*']) }}"><a class="{{ setSidebarActive(['roles.*']) }}"
                                    href="{{ route('roles.index') }}">Roles</a></li>
                        @endcan

                        @can('permission')
                            <li class="{{ setSidebarActive(['permissions.*']) }}"><a
                                    class="{{ setSidebarActive(['permissions.*']) }}"
                                    href="{{ route('permissions.index') }}">Permissions</a></li>
                        @endcan
                    </ul>
                </li> -->
            @endcan

            {{-- accounts management --}}
            @can('accounts-management')
            <!-- <li><a class="has-arrow" href="javascript:void()" aria-expanded="false"><i
                        class="fas fa-calculator"></i><span class="nav-text">Accounts Management</span></a>
                <ul aria-expanded="false" class="mm-collapse {{ setSidebarActive(['income.*']) }}">
                    @can('income')
                    <li class="{{ setSidebarActive(['income.index']) }}"><a
                            class="{{ setSidebarActive(['income.index']) }}"
                            href="{{ route('income.index') }}">Income</a></li>
                    @endcan
                </ul>
            </li> -->
            @endcan

            @can('business-note')
                <!-- <li><a href="{{ route('business-note.index') }}" aria-expanded="false">
                        <i class="fas fa-sticky-note"></i><span class="nav-text">Business Note List</span></a>
                </li> -->
            @endcan
            @can('apps-terms-and-conditions')
                <!-- <li><a href="{{ route('app-terms-and-conditions.index') }}" aria-expanded="false">
                        <i class="fas fa-file-contract"></i><span class="nav-text">Apps Terms&Conditions</span></a>
                </li> -->
            @endcan
            @can('import-csv')
                <!-- <li><a href="{{ route('csv.form') }}" aria-expanded="false">
                        <i class="fas fa-file-import"></i><span class="nav-text">Import CSV</span></a>
                </li> -->
            @endcan
            <!-- @can('about')
                <li><a href="{{ route('about-us.index') }}" aria-expanded="false"><i
                            class="fas fa-info-circle"></i><span class="nav-text">About Us</span></a>
                </li>
            @endcan
            @can('privacy-policy')
                <li><a href="{{ route('privacy-policy.index') }}" aria-expanded="false"><i
                            class="fas fa-shield-halved"></i><span class="nav-text">Privacy Policy</span></a>
                </li>
            @endcan
            @can('db-backup')
                <li><a href="{{ route('backup') }}" aria-expanded="false">
                        <i class="fa-solid fa-database"></i><span class="nav-text">Database Backup</span></a>
                </li>
            @endcan -->
            @can('company-info')
                <li><a href="{{ route('company-info.index') }}" aria-expanded="false">
                        <i class="icon icon-settings"></i><span class="nav-text">Company Info</span></a>
                </li>
            @endcan
        </ul>
    </div>
</div>
