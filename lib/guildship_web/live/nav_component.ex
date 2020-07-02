defmodule GuildshipWeb.NavComponent do
  use GuildshipWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""
    <div x-data="{ dropdown: false }">
      <nav x-data="{ open: false }" class="bg-fog-800">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="flex items-center justify-between h-16">
            <div class="flex items-center">
              <div class="flex-shrink-0">
                <h1 class="text-xl font-bold tracking-tight">Guildship</h1>
              </div>
              <div class="hidden sm:block sm:ml-6">
                <div class="flex">
                  <a href="#" class="px-3 py-2 rounded-md text-sm font-medium leading-5 text-white bg-fog-900 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Dashboard</a>
                  <a href="#" class="ml-4 px-3 py-2 rounded-md text-sm font-medium leading-5 text-fog-300 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Team</a>
                  <a href="#" class="ml-4 px-3 py-2 rounded-md text-sm font-medium leading-5 text-fog-300 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Projects</a>
                  <a href="#" class="ml-4 px-3 py-2 rounded-md text-sm font-medium leading-5 text-fog-300 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Calendar</a>
                </div>
              </div>
            </div>
            <div class="hidden sm:ml-6 sm:block">
              <div class="flex items-center">
                <button class="p-1 border-2 border-transparent text-fog-400 rounded-full hover:text-white focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">
                  <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
                  </svg>
                </button>

                <!-- Profile dropdown -->
                <div @click.away="open = false" class="ml-3 relative" x-data="{ open: false }">
                  <div>
                    <button @click="open = !open" class="flex text-sm border-2 border-transparent rounded-full focus:outline-none focus:border-white transition duration-150 ease-in-out">
                      <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80" alt="">
                    </button>
                  </div>
                  <div x-show="open" x-description="Profile dropdown panel, show/hide based on dropdown state." x-transition:enter="transition ease-out duration-100" x-transition:enter-start="transform opacity-0 scale-95" x-transition:enter-end="transform opacity-100 scale-100" x-transition:leave="transition ease-in duration-75" x-transition:leave-start="transform opacity-100 scale-100" x-transition:leave-end="transform opacity-0 scale-95" class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg" style="display: none;">
                    <div class="py-1 rounded-md bg-white shadow-xs">
                      <a href="#" class="block px-4 py-2 text-sm leading-5 text-fog-700 hover:bg-fog-100 focus:outline-none focus:bg-fog-100 transition duration-150 ease-in-out">Your Profile</a>
                      <a href="#" class="block px-4 py-2 text-sm leading-5 text-fog-700 hover:bg-fog-100 focus:outline-none focus:bg-fog-100 transition duration-150 ease-in-out">Settings</a>
                      <a href="#" class="block px-4 py-2 text-sm leading-5 text-fog-700 hover:bg-fog-100 focus:outline-none focus:bg-fog-100 transition duration-150 ease-in-out">Sign out</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="-mr-2 flex sm:hidden">
              <!-- Mobile menu button -->
              <button @click="open = !open" class="inline-flex items-center justify-center p-2 rounded-md text-fog-400 hover:text-white hover:bg-fog-700 focus:outline-none focus:bg-fog-700 focus:text-white transition duration-150 ease-in-out">
                <!-- Icon when menu is closed. -->
                <svg x-state-on="Menu open" x-state:on="Menu open" x-state-off="Menu closed" x-state:off="Menu closed" :class="{ 'hidden': open, 'block': !open }" x-bind-class="{ 'hidden': open, 'block': !open }" class="h-6 w-6 block" stroke="currentColor" fill="none" viewBox="0 0 24 24" null="[object Object]">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                </svg>
                <!-- Icon when menu is open. -->
                <svg x-state-on="Menu open" x-state:on="Menu open" x-state-off="Menu closed" x-state:off="Menu closed" :class="{ 'hidden': !open, 'block': open }" x-bind-class="{ 'hidden': !open, 'block': open }" class="h-6 w-6 hidden" stroke="currentColor" fill="none" viewBox="0 0 24 24" null="[object Object]">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <div x-description="Mobile menu, toggle classes based on menu state." x-state:on="Menu open" x-state:off="Menu closed" :class="{ 'block': open, 'hidden': !open }" class="sm:hidden hidden">
          <div class="px-2 pt-2 pb-3">
            <a href="#" class="block px-3 py-2 rounded-md text-base font-medium text-white bg-fog-900 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Dashboard</a>
            <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-fog-300 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Team</a>
            <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-fog-300 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Projects</a>
            <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-fog-300 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Calendar</a>
          </div>
          <div class="pt-4 pb-3 border-t border-fog-700">
            <div class="flex items-center px-5">
              <div class="flex-shrink-0">
                <img class="h-10 w-10 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=facearea&amp;facepad=2&amp;w=256&amp;h=256&amp;q=80" alt="">
              </div>
              <div class="ml-3">
                <div class="text-base font-medium leading-6 text-white">Tom Cook</div>
                <div class="text-sm font-medium leading-5 text-fog-400">tom@example.com</div>
              </div>
            </div>
            <div class="mt-3 px-2">
              <a href="#" class="block px-3 py-2 rounded-md text-base font-medium text-fog-400 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Your Profile</a>
              <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-fog-400 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Settings</a>
              <a href="#" class="mt-1 block px-3 py-2 rounded-md text-base font-medium text-fog-400 hover:text-white hover:bg-fog-700 focus:outline-none focus:text-white focus:bg-fog-700 transition duration-150 ease-in-out">Sign out</a>
            </div>
          </div>
        </div>
      </nav>
    </div>
    """
  end
end
