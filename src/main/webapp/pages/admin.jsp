<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../styles/output.css" rel="stylesheet">
</head>
<body>


    <button data-drawer-target="default-sidebar"
        data-drawer-toggle="default-sidebar" aria-controls="default-sidebar"
        type="button"
        class="ms-3 mt-2 inline-flex items-center rounded-lg p-2 text-sm text-gray-500 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 sm:hidden">
        <span class="sr-only">Open sidebar</span>
        <svg class="h-6 w-6" aria-hidden="true" fill="currentColor"
            viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path clip-rule="evenodd" fill-rule="evenodd"
                d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
        </svg>
    </button>

    <aside id="default-sidebar"
        class="fixed left-0 top-0 z-40 h-screen w-64 -translate-x-full transition-transform sm:translate-x-0"
        aria-label="Sidebar">
        <div
            class="h-full overflow-y-auto bg-gray-50 px-3 py-4">
            <ul class="space-y-2 font-medium">
                <li><a href="#"
                    class="group flex items-center rounded-lg p-2 text-gray-900 hover:bg-gray-100">
                        <svg
                            class="h-5 w-5 text-gray-500 transition duration-75 group-hover:text-gray-900"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 22 21">
                            <path
                                d="M16.975 11H10V4.025a1 1 0 0 0-1.066-.998 8.5 8.5 0 1 0 9.039 9.039.999.999 0 0 0-1-1.066h.002Z" />
                            <path
                                d="M12.5 0c-.157 0-.311.01-.565.027A1 1 0 0 0 11 1.02V10h8.975a1 1 0 0 0 1-.935c.013-.188.028-.374.028-.565A8.51 8.51 0 0 0 12.5 0Z" />
                        </svg> <span class="ms-3">Admin Panel</span>
                </a></li>

                <li><a href="#"
                    class="group flex items-center rounded-lg p-2 text-gray-900 hover:bg-gray-100">
                        <svg
                            class="h-5 w-5 flex-shrink-0 text-gray-500 transition duration-75 group-hover:text-gray-900"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 20 18">
                            <path
                                d="M14 2a3.963 3.963 0 0 0-1.4.267 6.439 6.439 0 0 1-1.331 6.638A4 4 0 1 0 14 2Zm1 9h-1.264A6.957 6.957 0 0 1 15 15v2a2.97 2.97 0 0 1-.184 1H19a1 1 0 0 0 1-1v-1a5.006 5.006 0 0 0-5-5ZM6.5 9a4.5 4.5 0 1 0 0-9 4.5 4.5 0 0 0 0 9ZM8 10H5a5.006 5.006 0 0 0-5 5v2a1 1 0 0 0 1 1h11a1 1 0 0 0 1-1v-2a5.006 5.006 0 0 0-5-5Z" />
                        </svg> <span class="ms-3 flex-1 whitespace-nowrap">Users</span>
                </a></li>
                <li><a href="#" id="manage-products-link"
                    class="group flex items-center rounded-lg p-2 text-gray-900 hover:bg-gray-100">
                        <svg
                            class="h-5 w-5 flex-shrink-0 text-gray-500 transition duration-75 group-hover:text-gray-900"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 18 20">
                            <path
                                d="M17 5.923A1 1 0 0 0 16 5h-3V4a4 4 0 1 0-8 0v1H2a1 1 0 0 0-1 .923L.086 17.846A2 2 0 0 0 2.08 20h13.84a2 2 0 0 0 1.994-2.153L17 5.923ZM7 9a1 1 0 0 1-2 0V7h2v2Zm0-5a2 2 0 1 1 4 0v1H7V4Zm6 5a1 1 0 1 1-2 0V7h2v2Z" />
                        </svg> <span class="ms-3 flex-1 whitespace-nowrap">Manage
                            Products</span>
                </a></li>
                <li><a href="#"
                    class="group flex items-center rounded-lg p-2 text-gray-900 hover:bg-gray-100">
                        <svg
                            class="h-5 w-5 flex-shrink-0 text-gray-500 transition duration-75 group-hover:text-gray-900"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 18 16">
                            <path stroke="currentColor" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="2"
                                d="M1 8h11m0 0L8 4m4 4-4 4m4-11h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-3" />
                        </svg> <span class="ms-3 flex-1 whitespace-nowrap">Orders</span>
                </a></li>
                <li><a href="#"
                    class="group flex items-center rounded-lg p-2 text-gray-900 hover:bg-gray-100">
                        <svg
                            class="h-5 w-5 flex-shrink-0 text-gray-500 transition duration-75 group-hover:text-gray-900"
                            aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                            fill="currentColor" viewBox="0 0 20 20">
                            <path
                                d="M5 5V.13a2.96 2.96 0 0 0-1.293.749L.879 3.707A2.96 2.96 0 0 0 .13 5H5Z" />
                            <path
                                d="M6.737 11.061a2.961 2.961 0 0 1 .81-1.515l6.117-6.116A4.839 4.839 0 0 1 16 2.141V2a1.97 1.97 0 0 0-1.933-2H7v5a2 2 0 0 1-2 2H0v11a1.969 1.969 0 0 0 1.933 2h12.134A1.97 1.97 0 0 0 16 18v-3.093l-1.546 1.546c-.413.413-.94.695-1.513.81l-3.4.679a2.947 2.947 0 0 1-1.85-.227 2.96 2.96 0 0 1-1.635-3.257l.681-3.397Z" />
                            <path
                                d="M8.961 16a.93.93 0 0 0 .189-.019l3.4-.679a.961.961 0 0 0 .49-.263l6.118-6.117a2.884 2.884 0 0 0-4.079-4.078l-6.117 6.117a.96.96 0 0 0-.263.491l-.679 3.4A.961.961 0 0 0 8.961 16Zm7.477-9.8a.958.958 0 0 1 .68-.281.961.961 0 0 1 .682 1.644l-.315.315-1.36-1.36.313-.318Zm-5.911 5.911 4.236-4.236 1.359 1.359-4.236 4.237-1.7.339.341-1.699Z" />
                        </svg> <span class="ms-3 flex-1 whitespace-nowrap">Log Out</span>
                </a></li>
            </ul>
        </div>
    </aside>



    <div id="content"
        class="relative overflow-x-auto shadow-md sm:rounded-lg ml-64 hidden">
        <!-- Adjust ml-64 to match the width of the sidebar -->
        <div class="pb-4 bg-white">
            <label for="table-search" class="sr-only">Search</label>
            <div class="relative mt-1">
                <div
                    class="absolute inset-y-0 rtl:inset-r-0 start-0 flex items-center ps-3 pointer-events-none">
                    <svg class="w-4 h-4 text-gray-500"
                        aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none"
                        viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round"
                            stroke-linejoin="round" stroke-width="2"
                            d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                    </svg>
                </div>
                <input type="text" id="table-search"
                    class="block pt-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500"
                    placeholder="Search for items">
            </div>
        </div>
        <table
            class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead
                class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="p-4">
                        <div class="flex items-center">
                            <input id="checkbox-all-search" type="checkbox"
                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-all-search" class="sr-only">checkbox</label>
                        </div>
                    </th>
                    <th scope="col" class="px-6 py-3">Product Name</th>
                    <th scope="col" class="px-6 py-3">Price</th>
                    <th scope="col" class="px-6 py-3">Brand</th>
                    <th scope="col" class="px-6 py-3">Description</th>
                    <th scope="col" class="px-6 py-3">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr
                    class="bg-white border-b hover:bg-gray-50">
                    <td class="w-4 p-4">
                        <div class="flex items-center">
                            <input id="checkbox-table-search-1" type="checkbox"
                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                            <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                        </div>
                    </td>
                    <td
                        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                        Apple MacBook Pro 17"</td>
                    <td class="px-6 py-4">$2999</td>
                    <td class="px-6 py-4">Apple</td>
                    <td class="px-6 py-4">Premium laptop with high performance.</td>
                    <td class="px-6 py-4"><a href="#"
                        class="font-medium text-blue-600 hover:underline">Edit</a>
                        <a href="#"
                        class="font-medium text-red-600 hover:underline">Delete</a>
                    </td>
                </tr>
                <!-- Add more rows here -->
            </tbody>
        </table>
        <button > <a href="./productCategory.jsp">Add Category </button></a> 
    </div>

</body>
<script>
    // Get the link for "Manage Products" in the sidebar
    const manageProductsLink = document.getElementById('manage-products-link');

    // Get the content div
    const contentDiv = document.getElementById('content');

    // Add click event listener to the "Manage Products" link
    manageProductsLink.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent default link behavior
        contentDiv.classList.toggle('hidden'); // Toggle the visibility of the content
    });
</script>
</html>
